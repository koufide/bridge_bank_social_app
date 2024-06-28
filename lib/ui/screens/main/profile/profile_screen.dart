import 'dart:io';

import 'package:bridgebank_social_app/app_setup.dart';
import 'package:bridgebank_social_app/configuration/colors.dart';
import 'package:bridgebank_social_app/ui/widgets/progress_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? photoUrl;
  bool _isUploadingPhoto = false;

  // String? photoUrl = "https://www.bridgebankgroup.com/images/popup/bridge-study.jpg";
  // https://cdn1.iconfinder.com/data/icons/project-management-8/500/worker-512.png

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            _isUploadingPhoto?Center(
              child: _builUploadingUi(),
            ):
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
          // print("==> add photo");
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
    return SizedBox(
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
                image:
                    // FileImage(
                    //   File(photoUrl!),
                    // ),
                    NetworkImage(
                  photoUrl!,
                ),
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
    print("==> _addPicture ==>>add picture");
    _takePicture();
    // _pickPicture();
  }

  void _takePicture() {
    final ImagePicker imagePicker = ImagePicker();
    imagePicker.pickImage(source: ImageSource.camera).then((XFile? image) {
      print("==> image ==> $image");
      if (image != null) {
        // photoUrl = image.path;
        // setState(() {});
        _uploadImage(image);
      }
    }).catchError((onError) {
      print("==> onError ==> $onError");
    });
  }

  void _uploadImage(XFile file) {
    if(mounted){
      setState(() {
        _isUploadingPhoto = true;
      });
    }
    print("Upload image");
    AppSetup.uploadImageService.uploadImage(File(file.path)).then((String url) {
      print("Response =>> $url");
      setState(() {
        photoUrl = url;
        _isUploadingPhoto = false;
      });
    }).catchError((error) {
      print("uploadImage() error => $error");
      _isUploadingPhoto = false;
    });
  }

  void _pickPicture() {
    final ImagePicker imagePicker = ImagePicker();
    imagePicker.pickImage(source: ImageSource.gallery).then((XFile? image) {
      print("image ==>> ${image?.path}");
      if (image != null) {
        photoUrl = image.path;
        setState(() {});
      }
    }).catchError((error) {
      print("_pickPicture() ==>>> Error $error");
    });
  }

  Widget _builUploadingUi() {
    return Container(
      width: 140,
      height: 140,
      // child: ProgressUi(),
      child: CircularProgressIndicator(),
      padding: EdgeInsets.all(10.dp),
      decoration: BoxDecoration(
        border: Border.all(

        ),
        shape: BoxShape.circle,
      ),
    );
  } // _pickPicture
}
