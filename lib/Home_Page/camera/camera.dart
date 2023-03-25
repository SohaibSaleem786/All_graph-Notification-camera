import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class camera extends StatefulWidget {
  const camera({Key? key}) : super(key: key);

  @override
  State<camera> createState() => _cameraState();
}

class _cameraState extends State<camera> {
  File? _imageFile;

  // final picker = ImagePicker();
  //
  // Future getImage() async {
  //   final image = await picker.getImage(
  //     source: ImageSource.camera
  //
  //   );
  //   setState(() {
  //     _image = File(image!.path);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Camera'),
      //   centerTitle: true,
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_imageFile != null)
            Container(
              width: 640,
              height: 480,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: FileImage(_imageFile!),
                ),
                border: Border.all(
                  width: 8,
                  color: Colors.black12,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                'Image should appear here',
                style: TextStyle(fontSize: 26),
              ),
            )
          else
            Container(
              width: 640,
              height: 480,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(
                  width: 8,
                  color: Colors.black12,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                'Image should appear here',
                style: TextStyle(fontSize: 26),
              ),
            ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      getImage(source: ImageSource.camera);
                    },
                    child: Text(
                      'Capture Image ',
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      getImage(source: ImageSource.gallery);
                    },
                    child: Text(
                      'Select Image ',
                      style: TextStyle(fontSize: 18),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);

    if (file?.path != null) {
      setState(() {
        _imageFile = File(file!.path);
      });
    }
  }
}
