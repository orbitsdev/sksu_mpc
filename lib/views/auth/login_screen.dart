import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:sksumpc/components/v.dart';
import 'package:sksumpc/controllers/auth/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isShowPassword = false;

  @override
  initState() {
    authController.getUsers();

    super.initState();
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
