import 'package:flutter/material.dart';
import 'package:photo_apps/views/image_upload/components/image_upload_action.dart';

class ImageUploadCard extends StatelessWidget {
  const ImageUploadCard({super.key});
  @override
  Widget build(BuildContext context) {
    bool highlighted1 = false;
    return SizedBox(
      width: 600,
      height: 500,
      child: Card(
        // color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: highlighted1 ? 5 : 3,
        child: const Padding(
          padding: EdgeInsets.all(30.0),
          child: ImageUploadAction(),
        ),
      ),
    );
  }
}
