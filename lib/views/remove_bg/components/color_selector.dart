import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      width: 500,
      child: GridView.builder(
        itemCount: bgcolors.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 3),
        itemBuilder: (context, index) {
          return Container(
            width: 20,
            height: 20,
            color: bgcolors[index],
          );
        },
      ),
    );
  }
}
