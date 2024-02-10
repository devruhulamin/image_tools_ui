import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_apps/state/image_upload/image_data_provider.dart';
import 'package:photo_apps/state/remove_bg/providers/remove_bg_provider.dart';
import 'package:photo_apps/views/components/animation/loading_animation.dart';

class RemoveBgCard extends ConsumerWidget {
  final ImageDataWithAspectRation imageData;
  const RemoveBgCard({super.key, required this.imageData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final removeBg = ref.watch(removeBgProvider(imageData.imgData));
    return SizedBox(
      width: 500,
      height: 400,
      child: AspectRatio(
        aspectRatio: imageData.aspectRation,
        child: removeBg.when(
          data: (data) {
            return Card(
              surfaceTintColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Image.network(
                  'http://127.0.0.1:8000${data.processedImageUrl}',
                ),
              ),
            );
          },
          error: (error, stackTrace) {
            return Center(
              child: Text('$error'),
            );
          },
          loading: () {
            return const LoadingAnimation();
          },
        ),
      ),
    );
  }
}
