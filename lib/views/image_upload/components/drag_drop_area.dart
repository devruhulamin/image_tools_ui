import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_apps/state/image_upload/image_data_provider.dart';
import 'package:photo_apps/state/image_upload/providers/is_highligted.dart';
import 'package:photo_apps/views/image_upload/extensions/get_image_aspect_ration_data.dart';

class DragAndDropArea extends ConsumerStatefulWidget {
  const DragAndDropArea({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DragAndDropAreaState();
}

class _DragAndDropAreaState extends ConsumerState<DragAndDropArea> {
  late DropzoneViewController controller;
  @override
  Widget build(BuildContext context) {
    return DropzoneView(
      mime: const ['image/jpeg', 'image/png', 'image/jpg'],
      operation: DragOperation.copy,
      cursor: CursorType.grab,
      onCreated: (DropzoneViewController ctrl) async {
        controller = ctrl;
      },
      onHover: () {
        ref.read(isHighlightedProvider.notifier).state = true;
      },
      onDrop: (dynamic ev) async {
        final filebytes = await controller.getFileData(ev);
        final imgAr = await filebytes.getImageAspectRation();

        ref.read(imageDataProvider.notifier).state =
            ImageDataWithAspectRation(imgData: filebytes, aspectRation: imgAr);
      },
      onLeave: () {
        ref.read(isHighlightedProvider.notifier).state = false;
      },
    );
  }
}
