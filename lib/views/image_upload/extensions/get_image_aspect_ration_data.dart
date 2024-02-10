import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photo_apps/views/image_upload/extensions/get_image_aspect_ration.dart';

extension GetImageDataAspectRation on Uint8List {
  Future<double> getImageAspectRation() async {
    final image = Image.memory(this);

    return await image.getAspectRation();
  }
}
