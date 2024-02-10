import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imageDataProvider = StateProvider<ImageDataWithAspectRation?>((ref) {
  return null;
});

class ImageDataWithAspectRation {
  final Uint8List imgData;
  final double aspectRation;

  ImageDataWithAspectRation(
      {required this.imgData, required this.aspectRation});
}
