import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sksumpc/components/h.dart';
import 'package:sksumpc/components/progress/loader.dart';
import 'package:sksumpc/components/v.dart';
import 'package:sksumpc/controllers/auth/auth_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sksumpc/utils/helpers/asset.dart';
import 'package:sksumpc/utils/themes/app_color.dart';
import 'package:sksumpc/views/home_screen.dart';

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
    Get.to(() => HomeScreen());
    // if (_formKey.currentState!.validate()) {
    //   final email = _formKey.currentState!.fields['email']?.value;
    //   final password = _formKey.currentState!.fields['password']?.value;
    //   await authController.login(
    //     email: email.trim(),
    //     password: password.trim(),
    //     parentContext: context,
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppColor.bggreen1,
              AppColor.bggreen2,
            ], // Set your desired gradient colors here
            begin:
                Alignment.topCenter, // Set the starting point of the gradient
            end: Alignment.bottomCenter, // Set the ending point of the gradient
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 40,
                        right: 8,
                        bottom: 16,
                        left: 8,
                      ),
                      decoration: const BoxDecoration(
                        color: AppColor.main,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100)),
                      ),
                      child: Image.asset(
                        Asset.image('mpc_logo.png'),
                        height: 110,
                        width: 110,
                      ),
                    ),
                  ],
                ),
                const V(40),
                const Text(
                  'SKSU',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const V(10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.main,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      child: const Text('Sign in')),
                ),
                const V(24),
                SizedBox(
                  height: 50,
                  child: IconButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColor.main,
                      ),
                      onPressed: () {},
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.string(
                              '<svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 0 48 48" width="48px" height="48px"><path fill="#fbc02d" d="M43.611,20.083H42V20H24v8h11.303c-1.649,4.657-6.08,8-11.303,8c-6.627,0-12-5.373-12-12	s5.373-12,12-12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C12.955,4,4,12.955,4,24s8.955,20,20,20	s20-8.955,20-20C44,22.659,43.862,21.35,43.611,20.083z"/><path fill="#e53935" d="M6.306,14.691l6.571,4.819C14.655,15.108,18.961,12,24,12c3.059,0,5.842,1.154,7.961,3.039	l5.657-5.657C34.046,6.053,29.268,4,24,4C16.318,4,9.656,8.337,6.306,14.691z"/><path fill="#4caf50" d="M24,44c5.166,0,9.86-1.977,13.409-5.192l-6.19-5.238C29.211,35.091,26.715,36,24,36	c-5.202,0-9.619-3.317-11.283-7.946l-6.522,5.025C9.505,39.556,16.227,44,24,44z"/><path fill="#1565c0" d="M43.611,20.083L43.595,20L42,20H24v8h11.303c-0.792,2.237-2.231,4.166-4.087,5.571	c0.001-0.001,0.002-0.001,0.003-0.002l6.19,5.238C36.971,39.205,44,34,44,24C44,22.659,43.862,21.35,43.611,20.083z"/></svg>',
                              width: 34,
                              height: 34),
                          H(10),
                          const Text('Sign in with Google')
                        ],
                      )),
                ),
                const V(10),
                const Text('Create Account ',
                    style: TextStyle(color: Colors.white)),
                const V(30),
                const Text(
                    'By continuing you agree to SKSU-COOPERATIVE\'s Terms of Service and Privacy Policy ',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
      //  Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: SingleChildScrollView(
      //     child: FormBuilder(
      //       key: _formKey,
      //       child: Obx(() {
      //         final parentContext = Get.context;
      //         return Column(
      //           mainAxisSize: MainAxisSize.max,
      //           children: [
      //             FormBuilderTextField(
      //               name: 'email',
      //               initialValue: 'briaa@gmail.com',
      //               decoration: InputDecoration(
      //                 filled: true,
      //                 border: InputBorder.none,
      //                 focusedBorder: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(10.0),
      //                   borderSide: BorderSide(),
      //                 ),
      //                 labelText: 'Email address',
      //               ),
      //               validator: FormBuilderValidators.required(),
      //             ),
      //             const SizedBox(height: 10),
      //             FormBuilderTextField(
      //               name: 'password',
      //               initialValue: '@password2!!',
      //               decoration: InputDecoration(
      //                 filled: true,
      //                 border: InputBorder.none,
      //                 focusedBorder: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(10.0),
      //                   borderSide: BorderSide(),
      //                 ),
      //                 labelStyle: TextStyle(),
      //                 labelText: 'Password',
      //               ),
      //               obscureText: !_isShowPassword,
      //               validator: FormBuilderValidators.compose([
      //                 FormBuilderValidators.required(),
      //                 FormBuilderValidators.minLength(6),
      //               ]),
      //             ),
      //             const SizedBox(height: 10),
      //             Row(
      //               children: [
      //                 SizedBox(
      //                   width: 24,
      //                   height: 24,
      //                   child: Checkbox(
      //                     side: const BorderSide(color: Colors.blue),
      //                     shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(4.0),
      //                     ),
      //                     value: _isShowPassword,
      //                     onChanged: (newValue) {
      //                       setState(() {
      //                         _isShowPassword = newValue!;
      //                       });
      //                     },
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             authController.isLoginLoading.value
      //                 ? Loader(width: 24, height: 24)
      //                 : ElevatedButton(
      //                     onPressed: () => submit(context),
      //                     child: Text('Login'),
      //                   ),
      //           ],
      //         );
      //       }),
      //     ),
      //   ),
      // ),
    );
  }
}
