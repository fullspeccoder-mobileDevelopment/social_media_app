import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:untitled_app/models/firebase_post.dart';

final draftProvider =
    StateNotifierProvider<DraftNotifier, List<LocalDraft>>((ref) {
  return DraftNotifier();
});

class LocalDraft {
  final String id;
  final FirebasePost draft;

  LocalDraft({
    required this.id,
    required this.draft,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'draft': draft.toMap(),
    };
  }

  factory LocalDraft.fromMap(Map<String, dynamic> map) {
    return LocalDraft(
      id: map['id'] ?? '',
      draft: FirebasePost.fromMap(map['draft']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalDraft.fromJson(String source) =>
      LocalDraft.fromMap(json.decode(source));
}

class DraftNotifier extends StateNotifier<List<LocalDraft>> {
  DraftNotifier() : super([]);

  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<void> createDraft(FirebasePost draft) async {
    // Creates DocumentReference when adding to Firestore
    final DocumentReference docReference =
        await _store.collection("drafts").add(draft.toMap());

    // Creates a DocumentSnapshot from the DocumentReference
    final DocumentSnapshot docSnapshot = await docReference.get();

    // Updates current state
    state = [
      ...state,
      LocalDraft(
        id: docSnapshot.id,
        draft: draft,
      ),
    ];
  }

  Future<void> deleteDraft() async {}

  Future<void> updateDraft() async {}

  Future<void> getDraft(String draftId) async {}
}
