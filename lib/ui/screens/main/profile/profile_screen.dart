import 'dart:io';

import 'package:bridgebank_social_app/configuration/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? photoUrl = null;
  // String? photoUrl = "https://www.bridgebankgroup.com/images/popup/bridge-study.jpg";
  // https://cdn1.iconfinder.com/data/icons/project-management-8/500/worker-512.png

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Center(
              child: photoUrl == null
                  ? _buildAddPhotoUi()
                  : _buildUploadedPhotoUi(),
            )
          ],
        ),
      ),
    );
  }

  _buildAddPhotoUi() {
    return Container(
      width: 160,
      height: 160,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          print("==> add photo");
          _addPicture();
        },
        icon: const Icon(
          Icons.add_a_photo,
          color: Colors.white,
          size: 60,
        ),
      ),
    );
  }

  _buildUploadedPhotoUi() {
    return Container(
      width: 160,
      height: 160,
      child: Stack(
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: FileImage(
                  File(photoUrl!),
                ),
                // NetworkImage(
                //   photoUrl!,
                // ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                print("==> on edit");
                _addPicture();
              },
              icon: const Icon(
                Icons.edit,
                color: AppColors.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addPicture() {
    print("==> add picture");
    _takePicture();
    // _pickPicture();
  }

  void _takePicture() {
    final ImagePicker imagePicker = ImagePicker();
    imagePicker.pickImage(source: ImageSource.camera).then((XFile? image) {
      if (image != null) {
          print("==> image ==> $image");
          photoUrl = image.path;

          setState(() {});

      }
    }).catchError((onError){
      print("==> onError ==> $onError");
    });

  }
}
