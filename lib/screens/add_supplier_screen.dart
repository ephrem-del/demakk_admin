import 'dart:io';

import 'package:demakk_admin/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../view_model/add_supplier_view_model.dart';

import '../main.dart';

enum PhotoOptions { camera, gallery }

class AddSupplierScreen extends StatefulWidget {
  const AddSupplierScreen({Key? key}) : super(key: key);

  @override
  State<AddSupplierScreen> createState() => _AddSupplierScreenState();
}

class _AddSupplierScreenState extends State<AddSupplierScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _commentController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late AddSupplierViewModel _addSupplierViewModel;
  File? _image;

  @override
  void initState() {
    super.initState();
    _addSupplierViewModel = AddSupplierViewModel();
  }

  void _selectPhotoFromGallery() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery); //getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  void _selectPhotoFromCamera() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  void _optionSelected(PhotoOptions option) {
    switch (option) {
      case PhotoOptions.camera:
        _selectPhotoFromCamera();
        break;
      case PhotoOptions.gallery:
        _selectPhotoFromGallery();
        break;
    }
  }

  void _authenticate(BuildContext context) {
    if (_formKey.currentState!.validate() && _image != null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: amharic
                  ? const Text('አቅራቢ በመጨመር ላይ')
                  : const Text('Adding Supplier'),
              content: amharic
                  ? const Text('አዲስ አቅራቢ መጨመር ትፈልጋለህ/ሽ?')
                  : const Text('Are you sure you want to add a new supplier?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFFC5C2C2),
                    ),
                  ),
                  child: amharic ? const Text('ሰርዝ') : const Text('Cancel'),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    String companyName = _nameController.text;
                    String address = _addressController.text;
                    String phoneNumber = _phoneNumberController.text;
                    String comment = _commentController.text;
                    _addSupplierViewModel.addSupplier(
                        companyName, address, phoneNumber, comment, _image);
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/home_screen');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                  ),
                  child: amharic ? const Text('አዎ') : const Text('Yes'),
                ),
                const SizedBox(
                  width: 11,
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: amharic ? const Text('አዲስ አቅራቢ') : const Text('Add Supplier'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  amharic
                      ? const Text(
                          'የድርጅት ስም',
                          style: subTitleTextStyle,
                        )
                      : const Text(
                          'Company Name',
                          style: subTitleTextStyle,
                        ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return amharic
                            ? 'የድርጅት ስም ማስገባት ግዴታ ነው'
                            : 'Company name is required';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: amharic
                        ? userInputDecoration(
                            'የድርጅት ስም  ...',
                            const Icon(Icons.person),
                          )
                        : userInputDecoration(
                            'Company Name  ...',
                            const Icon(Icons.person),
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  amharic
                      ? const Text(
                          'ስልክ ቁጥር',
                          style: subTitleTextStyle,
                        )
                      : const Text(
                          'Phone Number',
                          style: subTitleTextStyle,
                        ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _phoneNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return amharic
                            ? 'ስልክ ቁጥር ማስገባት ግዴታ ነው'
                            : 'Phone number is required';
                      } else if (value.length < 10 || value.length > 10) {
                        return amharic
                            ? 'ስልክ ቁጥር 10ዲጅት መሆን አለበት'
                            : 'Phone number must be 10 digits';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: amharic
                        ? userInputDecoration(
                            'ስልክ ቁጥር 09********',
                            const Icon(Icons.phone),
                          )
                        : userInputDecoration(
                            'Phone Number 09********',
                            const Icon(Icons.phone),
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  amharic
                      ? const Text(
                          'አድራሻ',
                          style: subTitleTextStyle,
                        )
                      : const Text(
                          'Address',
                          style: subTitleTextStyle,
                        ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return amharic
                            ? 'አድራሻ ማስገባት ግዴታ ነው'
                            : 'Address is required';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: amharic
                        ? userInputDecoration(
                            'አድራሻ እፎይታ BS045-34, B1-040 ...',
                            const Icon(Icons.location_on),
                          )
                        : userInputDecoration(
                            'Address Efoyta BS045-34, B1-040 ...',
                            const Icon(Icons.location_on),
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //

                  amharic
                      ? const Text(
                          'አስተያየት',
                          style: subTitleTextStyle,
                        )
                      : const Text(
                          'Comment',
                          style: subTitleTextStyle,
                        ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _commentController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return amharic
                            ? 'አስተያየት ማስገባት ግዴታ ነው'
                            : 'Comment is required';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.text,
                    decoration: amharic
                        ? userInputDecoration(
                            'ባነር፣ ስቲከር፣ ቲሸርት፣ ኢምብሮይደሪ',
                            const Icon(Icons.comment),
                          )
                        : userInputDecoration(
                            'Banner, Sticker, Tshirt, Embroidery',
                            const Icon(Icons.comment),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor)),
                      onPressed: () {},
                      child: PopupMenuButton<PhotoOptions>(
                        onSelected: _optionSelected,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: PhotoOptions.camera,
                            child: Text(amharic ? 'ፎቶ አንሳ' : 'Take a picture'),
                          ),
                          PopupMenuItem(
                            value: PhotoOptions.gallery,
                            child: Text(
                                amharic ? 'ከጋላሪ ምረጥ' : 'Select from Gallery'),
                          )
                        ],
                        child: Text(amharic ? 'ፎቶ ጨምር' : 'Add Photo'),
                      ),
                    ),
                  ),
                  // _image == null
                  //     ? Text(
                  //         amharic ? '' : 'Image is required',
                  //         style: TextStyle(color: Colors.red),
                  //       )
                  //     : SizedBox.shrink(),

                  _image == null
                      ? const SizedBox.shrink()
                      : SizedBox(
                          height: 300,
                          width: 300,
                          child: Image.file(_image!),
                        ),

                  //
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                    ),
                    onPressed: () {
                      _authenticate(context);
                    },
                    child: amharic
                        ? const Text('አቅራቢ ጨምር')
                        : const Text('Add Supplier'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
