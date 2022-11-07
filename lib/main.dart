import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendors_app/constants/color_constants.dart';

import 'features/authentication/auth_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
      home: const SafeArea(bottom: false, child: AuthWrapper()),
      // home: SafeArea(bottom: false, child: TestView1()),
      debugShowCheckedModeBanner: false,
      // debugShowMaterialGrid: true,
    );
  }
}
