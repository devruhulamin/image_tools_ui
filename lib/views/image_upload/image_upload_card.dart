import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_apps/state/image_upload/providers/is_highligted.dart';
import 'package:photo_apps/views/image_upload/components/image_upload_action.dart';

class ImageUploadCard extends ConsumerWidget {
  const ImageUploadCard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHighlighted = ref.watch(isHighlightedProvider);
    return SizedBox(
      width: 600,
      height: 500,
      child: Card(
        // color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: isHighlighted ? 7 : 3,
        child: const Padding(
          padding: EdgeInsets.all(30.0),
          child: ImageUploadAction(),
        ),
      ),
    );
  }
}
