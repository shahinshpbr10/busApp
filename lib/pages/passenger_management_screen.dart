import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class PassengerManagementScreen extends StatefulWidget {
  @override
  _PassengerManagementScreenState createState() => _PassengerManagementScreenState();
}

class _PassengerManagementScreenState extends State<PassengerManagementScreen> {
  File? _image;
  final picker = ImagePicker();

  Future<void> _getImage() async {
    // Use `pickImage` instead of `getImage`
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    final storageRef = FirebaseStorage.instance.ref().child('passenger_images/${DateTime.now()}.jpg');
    await storageRef.putFile(_image!);

    final downloadUrl = await storageRef.getDownloadURL();
    await FirebaseFirestore.instance.collection('passengers').add({
      'image_url': downloadUrl,
      'timestamp': FieldValue.serverTimestamp(),
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image uploaded successfully!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passenger Management'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? Text('No image selected.')
                : Image.file(_image!, height: 200),
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Capture Image'),
            ),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
