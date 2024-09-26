import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_oauth2_pkce/twitter_oauth2_pkce.dart';
// ignore: implementation_imports
import 'package:twitter_oauth2_pkce/src/scope.dart' as s;

import 'package:untitled_app/models/firebase_user.dart';
import 'package:untitled_app/utils/phone_manipulation.dart';

final userProvider = StateNotifierProvider<UserNotifier, LocalUser>((ref) {
  return UserNotifier();
});

class LocalUser {
  final String id;
  final FirebaseUser user;

  LocalUser({
    required this.id,
    required this.user,
  });

  LocalUser copyWith({
    String? id,
    FirebaseUser? user,
  }) {
    return LocalUser(
      id: id ?? this.id,
      user: user ?? this.user,
    );
  }
}

class UserNotifier extends StateNotifier<LocalUser> {
  UserNotifier()
      : super(
          LocalUser(id: "", user: FirebaseUser.zero()),
        );

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  final oauth2 = TwitterOAuth2Client(
    clientId: 'bnZ6U1ZBZmo5SkRkVmpIZGN5Rmg6MTpjaQ',
    clientSecret: 'xysW2BDg0wXtDWbTd_HTb6HSiAEGYoui1vP07H1VAVjnJtJbKP',
    redirectUri: 'com.crossmedia.oauth://callback/',
    customUriScheme: 'com.crossmedia.oauth',
  );

  /// Logs user in through Firebase and updates state
  Future<void> logIn(String email, String password) async {
    // Signs in user to Firebase
    await _auth.signInWithEmailAndPassword(email: email, password: password);

    // Gets a response from Firebase
    QuerySnapshot querySnapshot =
        await _store.collection("users").where('email', isEqualTo: email).get();

    // Handles empty docs of query snapshot
    if (querySnapshot.docs.isEmpty) {
      print("No firestore user associated to authenticated email $email");
      return;
    }

    // Handles more than 1 user with email
    if (querySnapshot.docs.length != 1) {
      print("More than one firestore user associate with email: $email");
      return;
    }

    // Updates state
    state = LocalUser(
        id: querySnapshot.docs[0].id,
        user: FirebaseUser.fromMap(
            querySnapshot.docs[0].data() as Map<String, dynamic>));
  }

  /// Logs user into Twitter
  ///
  /// Gets the [DocumentReference] from Firestore and uses it to update the user with the correct access token
  Future<void> logInWithTwitter() async {
    final DocumentReference docRef = _store.collection("users").doc(state.id);

    // Executes the log in process
    final response = await oauth2.executeAuthCodeFlowWithPKCE(
      scopes: [
        s.Scope.usersRead,
        s.Scope.tweetRead,
        s.Scope.tweetWrite,
      ],
    );

    // Updates the current user with access token
    _store.runTransaction((transaction) async {
      transaction.update(docRef, {
        'accessTokens': {"twitter": response.accessToken}
      });
    });

    // Updates current state with the access token
    state = state.copyWith(
      user: state.user.copyWith(
        accessTokens: {
          ...state.user.accessTokens,
          'twitter': response.accessToken
        },
      ),
    );
  }

  /// Signs up with Firebase & creates a Firestore document
  ///
  /// Signs up with Firebase using [email] and [password]
  Future<void> signUpWithEmail(String email, String password) async {
    // Createss a new user in the Firestore
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    // Creates an snapshot of the current amount of users
    final AggregateQuerySnapshot snapshot =
        await _store.collection('users').count().get();

    // Creates a DocumentReference with a default username
    final docReference = await _store.collection('users').add(
          FirebaseUser.zero(
            email: email,
            username: "User${snapshot.count}",
          ).toMap(),
        );

    // Creates a DocumentSnapshot of the Document
    final docSnapshot = await docReference.get();

    // Updates state
    state = LocalUser(
      id: docReference.id,
      user: FirebaseUser.fromMap(docSnapshot.data() as Map<String, dynamic>),
    );
  }

  /// Verifies with a phone number
  ///
  /// [areaCode] should be in the format - +00
  /// [phoneNumber] should be in the format 5555555555
  /// [codeSent] needs to be a function that provides a [verificationCode]
  Future<void> verifyWithPhoneNumber(
    String areaCode,
    String phoneNumber, {
    required void Function(String verificationId, int? resendToken) codeSent,
  }) async {
    // Verify Phone Number
    await _auth.verifyPhoneNumber(
      phoneNumber: '$areaCode$phoneNumber',
      verificationCompleted: (credential) {
        print('Verification Completed');
      },
      verificationFailed: (error) {
        print('Verification Failed');
        print(error.code);
        print(error.message);
        print(error.stackTrace);
        print(error.phoneNumber);
        return;
      },
      codeSent: codeSent,
      codeAutoRetrievalTimeout: (verificationId) {
        print('Code Auto Retrieval Running...');
      },
    );

    // Set State of LocalUser
    state = LocalUser(
      id: '',
      user: FirebaseUser.zero(
          phoneNumber: createPhoneString(areaCode, phoneNumber)),
    );
  }

  /// Signs up with the phone number
  ///
  /// [verificationId] is retrived from the [verifyPhoneNumber] function
  Future<void> signUpWithPhoneNumber(
    String verificationID,
    String verificationCode,
  ) async {
    // TODO Find out what is causing the issue where phone numbers won't recieve a text for the OTP passcode
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: verificationCode);
      await _auth.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }

    // Retrieve Count of Users
    final AggregateQuerySnapshot snapshot =
        await _store.collection('users').count().get();

    // Get Doc Reference from Store & Add User to Store
    final docReference = await _store.collection('users').add(
          FirebaseUser.zero(
            username: "User${snapshot.count}",
            phoneNumber: state.user.phoneNumber,
          ).toMap(),
        );

    final docSnapshot = await docReference.get();

    // Set State of LocalUser
    state = LocalUser(
      id: docReference.id,
      user: FirebaseUser.fromMap(docSnapshot.data() as Map<String, dynamic>),
    );
  }

  /// Logs in with the phone number
  ///
  /// [verificationId] is retrived from the [verifyPhoneNumber] function
  Future<void> logInWithPhoneNumber(
    String verificationID,
    String verificationCode,
  ) async {
    try {
      // Retrieves credential from the PhoneAuthProvider
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: verificationCode);

      // Signs user in through authentication
      await _auth.signInWithCredential(credential);
    } catch (e) {
      print(e);
      return;
    }

    // Creates a QuerySnapshot
    final QuerySnapshot querySnapshot = await _store
        .collection('users')
        .where('phoneNumber',
            isEqualTo:
                createPhoneStringFromAuth(_auth.currentUser!.phoneNumber!))
        .get();

    // Creates a DocumentSnapshot of the queried Document
    final DocumentSnapshot docSnapshot = querySnapshot.docs[0];

    // Set State of LocalUser
    state = LocalUser(
      id: docSnapshot.id,
      user: FirebaseUser.fromMap(docSnapshot.data() as Map<String, dynamic>),
    );
  }

  /// Signs up through Google
  Future<void> signUpWithGoogle() async {
    // Creates a UserCredential which is instantiated later
    late UserCredential credential;

    try {
      // Signs in with the GoogleAuthProvider
      credential = await _auth.signInWithProvider(GoogleAuthProvider());
    } catch (e) {
      print(e);
    }

    // Retrieve Count of Users
    final AggregateQuerySnapshot snapshot =
        await _store.collection('users').count().get();

    // Retrieves a DocumentReference & Adds to Firestore using default username
    final DocumentReference docReference =
        await _store.collection("users").add(FirebaseUser.zero(
              email: credential.user!.email,
              username: "User${snapshot.count}",
              profilePicUrl: credential.user!.photoURL,
            ).toMap());

    // Creates a DocumentSnapshot
    final DocumentSnapshot docSnapshot = await docReference.get();

    // Updates current state
    state = LocalUser(
        id: docSnapshot.id,
        user: FirebaseUser.fromMap(docSnapshot.data() as Map<String, dynamic>));
  }

  // TODO Implement Google Log In
  // Future<void> logInWithGoogle() async {}

  // Signs out of Firebase
  Future<void> signOut() async {
    // Signs out of Firebase
    await _auth.signOut();

    // Updates current state
    state = LocalUser(
      id: '',
      user: FirebaseUser.zero(),
    );
  }
}
