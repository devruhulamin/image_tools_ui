import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:photo_apps/views/image_upload/components/drag_drop_area.dart';
import 'package:photo_apps/views/image_upload/components/image_upload_icon_text.dart';

class ImageUploadAction extends StatelessWidget {
  const ImageUploadAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upload Your File:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: DottedBorder(
            color: Colors.grey,
            strokeWidth: 2,
            child: const Stack(
              children: [
                DragAndDropArea(),
                Center(
                  child: ImageUploadIconText(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
