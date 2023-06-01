import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:sksumpc/components/progress/loader.dart';
import 'package:sksumpc/components/v.dart';
import 'package:sksumpc/controllers/auth/auth_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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

  void submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final name = _formKey.currentState!.fields['name']?.value;
      final email = _formKey.currentState!.fields['email']?.value;
      final password = _formKey.currentState!.fields['password']?.value;
      authController.register(
        name: name.trim(),
        email: email.trim(),
        password: password.trim(),
        context: context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laravel Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: GetBuilder<AuthController>(
              builder: (controller) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FormBuilderTextField(
                      name: 'name',
                      decoration: InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the border radius as needed
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Full name',
                      ),
                      validator: FormBuilderValidators.required(),
                    ),
                    const V(10),
                    FormBuilderTextField(
                      name: 'email',
                      decoration: InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the border radius as needed
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Email address',
                      ),
                      validator: FormBuilderValidators.required(),
                    ),
                    const V(10),
                    FormBuilderTextField(
                      name: 'password',
                      decoration: InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the border radius as needed
                          borderSide: BorderSide(),
                        ),
                        labelStyle: TextStyle(),
                        labelText: 'Password',
                      ),
                      obscureText: !_isShowPassword,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(6),
                      ]),
                    ),
                    const V(10),
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            side: const BorderSide(
                              color: Colors.blue,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  4.0), // Set the desired border radius here
                            ),
                            value: _isShowPassword,
                            onChanged: (newValue) {
                              setState(() {
                                _isShowPassword = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    controller.isRegisterLoading.value
                        ? Loader(width: 24, height: 24)
                        : Builder(builder: (context) {
                            return ElevatedButton(
                                onPressed: () => submit(context),
                                child: Text('Login'));
                          })
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
