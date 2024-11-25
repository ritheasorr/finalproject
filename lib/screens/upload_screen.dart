import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:finalproject/widgets/app_bar.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  File? _image;
  Uint8List? _webImageBytes; // To store image bytes for web
  String? _imageUrl;
  bool _isUploading = false;
  UploadState _uploadState = UploadState.initial;

  Future<void> _pickImage() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (kIsWeb) {
        // If it's web, read the bytes and store them in a Uint8List
        final bytes = await pickedFile.readAsBytes();
        setState(() {
          _image = File('a'); // Dummy file for web
          _webImageBytes = bytes;
        });
      } else {
        // If it's mobile, use the File object directly
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    }
  }

  Future<void> _uploadImage() async {
    if (_formKey.currentState!.validate() && _image != null) {
      setState(() {
        _isUploading = true;
        _uploadState = UploadState.uploading;
      });

      try {
        final url = Uri.parse('https://api.imgbb.com/1/upload');
        final request = http.MultipartRequest('POST', url);

        // Add image as multipart file
        if (kIsWeb) {
          // For web, pass image bytes directly
          request.files.add(http.MultipartFile.fromBytes(
            'image',
            _webImageBytes!,
            filename: 'uploaded_image.png',
          ));
        } else {
          // For mobile, use the file path
          request.files.add(await http.MultipartFile.fromPath('image', _image!.path));
        }

        // Add API key and expiration fields
        request.fields['key'] = '0c34e8e13a05e32d8c8bfa0be628bbcf';
        request.fields['expiration'] = '1209600';

        // Send the request
        final response = await request.send();
        final responseData = await response.stream.bytesToString();
        final jsonData = jsonDecode(responseData);

        if (response.statusCode == 200) {
          setState(() {
            _imageUrl = jsonData['data']['url'];
            _uploadState = UploadState.success;
          });

          // Add product data to Firestore
          final querySnapshot = await FirebaseFirestore.instance.collection('1').get();
          final documentLength = querySnapshot.docs.length;

          await FirebaseFirestore.instance
              .collection('1')
              .doc((documentLength + 1).toString())
              .set({
            'Name': _nameController.text,
            'Price': double.parse(_priceController.text),
            'Description': _descriptionController.text,
            'ImageUrl': _imageUrl,
          });

          // Reset the form and image
          _formKey.currentState?.reset();
          setState(() {
            _image = null;
            _webImageBytes = null;
            _imageUrl = null;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product added successfully!')),
          );
        } else {
          setState(() {
            _uploadState = UploadState.error;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error uploading image: ${jsonData['error']['message']}'),
            ),
          );
        }
      } catch (e) {
        setState(() {
          _uploadState = UploadState.error;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error uploading image: $e')),
        );
      } finally {
        setState(() {
          _isUploading = false;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a price';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Conditional rendering for upload states
                if (_uploadState == UploadState.initial)
                  const Text(''),
                if (_uploadState == UploadState.uploading)
                  const CircularProgressIndicator(),
                if (_uploadState == UploadState.success && _imageUrl != null)
                  Column(
                    children: [
                      Image.network(_imageUrl!),
                      const SizedBox(height: 10),
                      Text('Image URL: $_imageUrl'),
                    ],
                  ),
                if (_uploadState == UploadState.error)
                  const Text('Error uploading image.'),
                const SizedBox(height: 20),
                // Display selected image for mobile or web
                if (_image != null)
                  kIsWeb && _webImageBytes != null
                      ? Image.memory(_webImageBytes!) // Web image rendering
                      : Image.file(_image!),        // Mobile image rendering
                ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('Select Image'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isUploading ? null : _uploadImage,
                  child: _isUploading
                      ? const CircularProgressIndicator()
                      : const Text('Upload Product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

// Enum to represent the upload state
enum UploadState { initial, uploading, success, error }