import 'package:flutter/material.dart';

class ImageUploadIconText extends StatelessWidget {
  const ImageUploadIconText({super.key});

  @override
  Widget build(BuildContext context) {
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
          onPressed: () async {},
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
