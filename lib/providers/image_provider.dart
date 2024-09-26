import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final imageProvider = StateNotifierProvider<ImageStateNotifier, File?>((ref) {
  return ImageStateNotifier();
});

class ImageStateNotifier extends StateNotifier<File?> {
  ImageStateNotifier() : super(null);

  /// Sets image
  void getImageFile(String path) {
    state = File(path);
  }

  /// Resets image
  void resetImage() {
    state = null;
  }
}
