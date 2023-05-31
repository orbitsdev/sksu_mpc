import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:sksumpc/components/v.dart';
import 'package:sksumpc/controllers/auth/auth_controller.dart';
import 'package:image_picker/image_picker.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isShowPassword = false;

  File? image;

  

  @override
  initState() {
    authController.getUsers();

    super.initState();
  }

    Future<void> chooseImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laravel Api'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: GetBuilder<AuthController>(builder: (controller) {
            return Column(mainAxisSize: MainAxisSize.max, children: [
              Container(
                height: 300,
                constraints: BoxConstraints(
                  minHeight: 300,
                ),
                child: ListView.builder(
                    itemCount: controller.users.length,
                    itemBuilder: (context, index) {
                      final user = controller.users[index];
                      return Container(child: Text('${user.name}'));
                    }),
              ),


               Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: chooseImage,
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: image != null
                            ? Image.file(
                                width: double.infinity,
                                image!,
                                fit: BoxFit.cover,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  // Handle image load errors here
                                  return Center(
                                      child: Text('Error loading image'));
                                },
                              )
                            : Center(
                                child: Icon(Icons.image),
                              ),
                      ),
                    ),
                  ),


                  const V(20),
             if(image !=null) controller.isUploading.value
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: ()=> controller.uploadFileDio(image as File), child: Text('Upload')),
              const V(10),
              controller.isUsersLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: controller.getUsers, child: Text('Users')),
              const V(10),
              controller.isUsersLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: controller.getUsers, child: Text('Users')),
              const V(10),
              controller.isLoginLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: controller.login, child: Text('Login')),
              const V(10),
              controller.isRegisterLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: controller.register, child: Text('Register')),
            ]);
          }),
        ),
      ),
    );
  }
}
