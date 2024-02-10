import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_apps/state/image_upload/image_data_provider.dart';
import 'package:photo_apps/views/image_upload/extensions/get_image_aspect_ration_data.dart';

class ImageUploadIconText extends ConsumerWidget {
  const ImageUploadIconText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.image,
          size: 60,
          color: Colors.blue,
        ),
        const Text(
          'Drag & Drop',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () async {
            final ImagePicker picker = ImagePicker();
            final imgXfile =
                await picker.pickImage(source: ImageSource.gallery);
            if (imgXfile == null) {
              return;
            }
            final imgByte = await imgXfile.readAsBytes();
            final aspectRation = await imgByte.getImageAspectRation();
            ref.read(imageDataProvider.notifier).state =
                ImageDataWithAspectRation(
                    imgData: imgByte, aspectRation: aspectRation);
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
            textStyle: const TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          child: const Text('Browse'),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          "Supports: JPEG,JPG,PNG",
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
