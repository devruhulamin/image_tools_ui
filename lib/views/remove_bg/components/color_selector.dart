import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_apps/state/remove_bg/providers/image_background_color_provider.dart';
import 'package:photo_apps/views/remove_bg/components/colors_list.dart';

class ColorSelector extends ConsumerStatefulWidget {
  const ColorSelector({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends ConsumerState<ColorSelector> {
  @override
  Widget build(BuildContext context) {
    final bgcolors = allBgColors;
    return SizedBox(
      width: 300,
      height: 500,
      child: GridView.builder(
        itemCount: bgcolors.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 30, crossAxisSpacing: 8, mainAxisSpacing: 8),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              ref.read(imageBgColorProvider.notifier).state = bgcolors[index];
            },
            child: Container(
              color: bgcolors[index],
            ),
          );
        },
      ),
    );
  }
}
