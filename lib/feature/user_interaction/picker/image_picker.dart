import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerExample extends StatefulWidget {
  const ImagePickerExample({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _image != null
            ? Image.file(File(_image?.path ?? ""))
            : SizedBox.shrink(),
        ElevatedButton(
            onPressed: () async {
              final picker = ImagePicker();
              final pickedFile =
                  await picker.pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                setState(
                  () {
                    _image = pickedFile;
                  },
                );
              }
            },
            child: Text(
              "Add Image",
            )),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

ButtonStyle buttonStyleBlack = const ButtonStyle(
  padding: MaterialStatePropertyAll(
    EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 8,
    ),
  ),
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
  ),
  iconColor: MaterialStatePropertyAll(Colors.white),
  backgroundColor: MaterialStatePropertyAll(Colors.black),
);

ButtonStyle buttonStyleWhite = const ButtonStyle(
  padding: MaterialStatePropertyAll(
    EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 8,
    ),
  ),
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
  ),
  iconColor: MaterialStatePropertyAll(Colors.black),
  backgroundColor: MaterialStatePropertyAll(Colors.white),
);
