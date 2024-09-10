import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final imageProvider = StateNotifierProvider<ImageStateNotifier, File?>((ref) {
  return ImageStateNotifier();
});

class ImageStateNotifier extends StateNotifier<File?> {
  ImageStateNotifier() : super(null);

  void getImageFile(String path) {
    state = File(path);
  }

  void resetImage() {
    state = null;
  }
}
