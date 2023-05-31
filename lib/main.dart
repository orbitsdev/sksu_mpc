import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sksumpc/binding.dart/app_bindings.dart';
import 'package:sksumpc/utils/themes/app_color.dart';
import 'package:sksumpc/views/auth/login_screen.dart';
import 'package:sksumpc/views/home_screen.dart';
import 'package:sksumpc/views/start/boarding_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget authLogic() {
    return LoginScreen();
    return const HomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorSchemeSeed: AppColor.main,
        useMaterial3: true,
      ).copyWith(
          textTheme: TextTheme(
        headline1: GoogleFonts.poppins(textStyle: textTheme.bodyText2),
        headline2: GoogleFonts.poppins(textStyle: textTheme.bodyText2),
        headline3: GoogleFonts.poppins(textStyle: textTheme.bodyText2),
        headline4: GoogleFonts.poppins(textStyle: textTheme.bodyText2),
        headline5: GoogleFonts.poppins(textStyle: textTheme.bodyText2),
        headline6: GoogleFonts.poppins(textStyle: textTheme.bodyText2),
        bodyText1: GoogleFonts.poppins(textStyle: textTheme.bodyText2),
        bodyText2: GoogleFonts.poppins(textStyle: textTheme.bodyText2),
      )),
      home: authLogic(),
      getPages: [
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/welcome', page: () => const BoardingScreen()),
        GetPage(name: '/login', page: () => const LoginScreen()),
      ],
    );
  }
}
