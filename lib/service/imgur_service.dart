import 'dart:io';

abstract class ImgurService {
  Future<String> uploadImage(File file);
}