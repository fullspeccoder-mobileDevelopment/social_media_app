// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:untitled_app/main.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled_app/components/home/draft_card.dart';
import 'package:untitled_app/models/firebase_post.dart';
import 'package:untitled_app/providers/draft_provider.dart';

void main() {
  testWidgets('creates a draft card component', (tester) async {
    await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
            home: DraftCard(
                draft: LocalDraft(
                    id: 'someId',
                    draft: FirebasePost(
                        content: 'some content here',
                        imageUrl: 'some image url here',
                        userId: 'some user id here',
                        tags: [],
                        postDate: Timestamp.now()))))));
  });
}

/*
* Versioning Info
* 1.2.3
* 
* 1 - Major revision (new UI, lots of new features, conceptual change, etc)
* 2 - Minor revision (change to a search box, 1 feature added, collection of bug fixes)
* 3 - Bug fix release
 */