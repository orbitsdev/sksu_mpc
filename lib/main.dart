


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sksumpc/utils/themes/app_color.dart';
import 'package:sksumpc/views/home_screen.dart';
import 'package:sksumpc/views/start/boarding_screen.dart';

void main(){
    WidgetsFlutterBinding.ensureInitialized();
}


class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  Widget authLogic(){

    return  const HomeScreen();
  }


  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: AppColor.main,
      ).copyWith(
        useMaterial3: true,
        
      ),
      home: authLogic(),
      getPages: [
        GetPage(name: '/home', page: ()=> const HomeScreen()),
        GetPage(name: '/welcome', page: ()=> const BoardingScreen())
      ],
    );
  }
}