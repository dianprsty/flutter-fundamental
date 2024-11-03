import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerExample extends StatefulWidget {
  const FilePickerExample({super.key});

  @override
  State<FilePickerExample> createState() => _FilePickerExampleState();
}

class _FilePickerExampleState extends State<FilePickerExample> {
  File? _file;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _file != null
            ? Text(_file!.path.replaceFirst('${_file!.parent.path}/', ''))
            : Container(),
        ElevatedButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                allowMultiple: true,
                type: FileType.image,
              );

              if (result != null) {
                setState(() {
                  _file = File(result.files.single.path!);
                  print(_file);
                });
              }
            },
            child: const Text('Pick File')),
      ],
    );
  }
}
