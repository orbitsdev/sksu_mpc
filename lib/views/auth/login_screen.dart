import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:sksumpc/components/progress/loader.dart';
import 'package:sksumpc/controllers/auth/auth_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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
    // authController.getUsers();
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

  
void submit(BuildContext context) async {
  if (_formKey.currentState!.validate()) {
    final email = _formKey.currentState!.fields['email']?.value;
    final password = _formKey.currentState!.fields['password']?.value;
    await authController.login(
      email: email.trim(),
      password: password.trim(),
      parentContext: context,
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
  child: Obx(() {
    final parentContext = Get.context;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        FormBuilderTextField(
          name: 'email',
            initialValue: 'briaa@gmail.com',
          decoration: InputDecoration(
            filled: true,
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(),
            ),
            labelText: 'Email address',
          ),
          validator: FormBuilderValidators.required(),
        ),
        const SizedBox(height: 10),
        FormBuilderTextField(
          name: 'password',
              initialValue: '@password2!!',
          decoration: InputDecoration(
            filled: true,
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
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
        const SizedBox(height: 10),
        Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                side: const BorderSide(color: Colors.blue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
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
        authController.isLoginLoading.value
            ? Loader(width: 24, height: 24)
            :ElevatedButton(
                  onPressed: () => submit(context),
                  child: Text('Login'),
                ),
      ],
    );
  }),
),

        ),
      ),
    );
  }
}
