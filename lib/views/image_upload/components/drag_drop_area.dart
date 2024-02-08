import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class DragAndDropArea extends StatefulWidget {
  const DragAndDropArea({super.key});

  @override
  State<DragAndDropArea> createState() => _DragAndDropAreaState();
}

class _DragAndDropAreaState extends State<DragAndDropArea> {
  late DropzoneViewController controller1;
  String message1 = 'Drop something here';
  String message2 = 'Drop something here';
  bool highlighted1 = false;
  @override
  Widget build(BuildContext context) {
    return DropzoneView(
      mime: const ['image/jpeg', 'image/png', 'image/jpg'],
      operation: DragOperation.copy,
      cursor: CursorType.grab,
      onCreated: (DropzoneViewController ctrl) async {
        controller1 = ctrl;
      },
      onLoaded: () => print('Zone loaded'),
      onError: (String? ev) => print('Error: $ev'),
      onHover: () {
        setState(() {
          highlighted1 = true;
        });
      },
      onDrop: (dynamic ev) => print('Dropxx: $ev'),
      onLeave: () {
        setState(() {
          highlighted1 = false;
        });
      },
    );
  }
}
