import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendors_app/components/components.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/features/authentication/register/view/set_menu.dart';
import 'package:vendors_app/services/time_provider.dart';
import 'package:vendors_app/test/test_view.dart';

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
        scaffoldBackgroundColor: scaffoldBackgroundColor, // * color
      ),
      builder: (context, child) =>
          CurrentTime(child: child ?? const SizedBox()),
      home: const AuthWrapper(),
      // home: SafeArea(bottom: false, child: TestView1()),
      debugShowCheckedModeBanner: false,
      // debugShowMaterialGrid: true,
    );
  }
}
