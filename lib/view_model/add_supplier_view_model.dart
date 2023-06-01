import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../objects/supplier.dart';

class AddSupplierViewModel {
  Future<bool> addSupplier(
      companyName, address, phoneNumber, comment, image) async {
    bool isSaved = false;
    String imageDownloadUrl = '';
    //File? _image = image;

    imageDownloadUrl = await _uploadFile(image);

    Supplier supplier = Supplier(
      companyName: companyName,
      phoneNumber: phoneNumber,
      address: address,
      comment: comment,
      imageDownloadUrl: imageDownloadUrl,
    );
    try {
      FirebaseFirestore.instance.collection('suppliers').add(supplier.toMap());
      isSaved = true;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return isSaved;
  }

  Future<String> _uploadFile(File file) async {
    String imageDownloadUrl = '';
    const uuid = Uuid();
    final filePath = '/images/${uuid.v4()}.jpg';
    final storage = FirebaseStorage.instance.ref(filePath);
    final uploadTask = await storage.putFile(file);
    print('file uploaded');

    if (uploadTask.state == TaskState.success) {
      imageDownloadUrl =
          await FirebaseStorage.instance.ref(filePath).getDownloadURL();
      print(imageDownloadUrl);
    }
    return imageDownloadUrl;
  }
}
