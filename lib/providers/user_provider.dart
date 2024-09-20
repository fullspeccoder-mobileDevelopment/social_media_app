import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_oauth2_pkce/twitter_oauth2_pkce.dart';
// ignore: implementation_imports
import 'package:twitter_oauth2_pkce/src/scope.dart' as s;

import 'package:untitled_app/models/firebase_user.dart';
import 'package:untitled_app/providers/post_provider.dart';
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

  Future<void> logIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    QuerySnapshot response =
        await _store.collection("users").where('email', isEqualTo: email).get();
    if (response.docs.isEmpty) {
      print("No firestore user associated to authenticated email $email");
      return;
    }
    if (response.docs.length != 1) {
      print("More than one firestore user associate with email: $email");
      return;
    }
    state = LocalUser(
        id: response.docs[0].id,
        user: FirebaseUser.fromMap(
            response.docs[0].data() as Map<String, dynamic>));
  }

  Future<void> logInWithTwitter() async {
    final DocumentReference docRef = _store.collection("users").doc(state.id);

    final response = await oauth2.executeAuthCodeFlowWithPKCE(
      scopes: [
        s.Scope.usersRead,
        s.Scope.tweetRead,
        s.Scope.tweetWrite,
      ],
    );

    _store.runTransaction((transaction) async {
      transaction.update(docRef, {
        'accessTokens': {"twitter": response.accessToken}
      });
    });

    state = state.copyWith(
      user: state.user.copyWith(
        accessTokens: {
          ...state.user.accessTokens,
          'twitter': response.accessToken
        },
      ),
    );
  }

  Future<void> signUpWithEmail(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    final AggregateQuerySnapshot snapshot =
        await _store.collection('users').count().get();
    final docReference = await _store.collection('users').add(
          FirebaseUser.zero(
            email: email,
            username: "User${snapshot.count}",
          ).toMap(),
        );

    final docSnapshot = await docReference.get();
    state = LocalUser(
      id: docReference.id,
      user: FirebaseUser.fromMap(docSnapshot.data() as Map<String, dynamic>),
    );
  }

  Future<void> verifyWithPhoneNumber(
    String areaCode,
    String phoneNumber, {
    required void Function(String verificationId, int? resendToken) codeSent,
  }) async {
    print('$areaCode$phoneNumber');
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

  Future<void> logInWithPhoneNumber(
    String verificationID,
    String verificationCode,
  ) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: verificationCode);
      await _auth.signInWithCredential(credential);
    } catch (e) {
      print(e);
      return;
    }

    final Query query = _store.collection('users').where('phoneNumber',
        isEqualTo: createPhoneStringFromAuth(_auth.currentUser!.phoneNumber!));

    final QuerySnapshot querySnapshot = await query.get();

    final DocumentSnapshot docSnapshot = querySnapshot.docs[0];

    // Set State of LocalUser
    state = LocalUser(
      id: docSnapshot.id,
      user: FirebaseUser.fromMap(docSnapshot.data() as Map<String, dynamic>),
    );
  }

  Future<void> signUpWithGoogle() async {
    late UserCredential credential;
    try {
      credential = await _auth.signInWithProvider(GoogleAuthProvider());
      print(credential.user!.email ?? 'No associated email');
    } catch (e) {
      print(e);
    }

    // Retrieve Count of Users
    final AggregateQuerySnapshot snapshot =
        await _store.collection('users').count().get();

    final DocumentReference docReference =
        await _store.collection("users").add(FirebaseUser.zero(
              email: credential.user!.email,
              username: "User${snapshot.count}",
              profilePicUrl: credential.user!.photoURL,
            ).toMap());

    final DocumentSnapshot docSnapshot = await docReference.get();

    state = LocalUser(
        id: docSnapshot.id,
        user: FirebaseUser.fromMap(docSnapshot.data() as Map<String, dynamic>));
  }

  // TODO Implement Google Log In
  // Future<void> logInWithGoogle() async {}

  Future<void> signOut() async {
    await _auth.signOut();

    state = LocalUser(
      id: '',
      user: FirebaseUser.zero(),
    );
  }

  Future<void> updateUserPosts(PostList postList) async {
    // Create list of post ids
    final List<String> postIds = postList.posts.map((el) => el.postId).toList();

    // Firebase Update
    final DocumentReference docReference =
        _store.collection('users').doc(state.id);

    await docReference.update({'posts': postIds});

    // Updates the state
    state = state.copyWith(
      user: state.user.copyWith(posts: postIds),
    );
  }
}
