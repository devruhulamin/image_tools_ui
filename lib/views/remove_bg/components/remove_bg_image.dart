import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:html' as html;

import 'package:photo_apps/state/remove_bg/models/image_model.dart';
import 'package:screenshot/screenshot.dart';

class RemoveBgImageSection extends ConsumerStatefulWidget {
  final ImageModel data;
  const RemoveBgImageSection({super.key, required this.data});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RemoveBgImageSectionState();
}

class _RemoveBgImageSectionState extends ConsumerState<RemoveBgImageSection> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 3),
          ),
          child: Screenshot(
            controller: screenshotController,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 38, 31, 31),
              ),
              child: Image.network(
                'http://127.0.0.1:8000${widget.data.processedImageUrl}',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () async {
            final imageFile = await screenshotController.capture();
            if (imageFile == null) {
              return;
            }
            final blob = html.Blob(
                [imageFile], 'image/png'); // Use 'image/png' mime type
            final anchor = html.AnchorElement(
                href: html.Url.createObjectUrlFromBlob(blob));
            anchor.setAttribute('download', 'my_image.png');
            anchor.click();
          },
          child: const Text("Download"),
        ),
      ],
    );
  }
}
