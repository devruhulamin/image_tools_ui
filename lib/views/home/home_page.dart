import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_apps/state/image_upload/image_data_provider.dart';
import 'package:photo_apps/views/image_upload/image_upload_card.dart';
import 'package:photo_apps/views/remove_bg/remove_bg_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Remove Bg")),
      body: Center(child: Consumer(
        builder: (context, ref, child) {
          final imgData = ref.watch(imageDataProvider);
          if (imgData != null) {
            return RemoveBgCard(
              imageData: imgData,
            );
          } else {
            return const ImageUploadCard();
          }
        },
      )),
    );
  }
}
