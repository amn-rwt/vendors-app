import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendors_app/constants/color_constants.dart';
import 'package:vendors_app/features/authentication/auth_wrapper.dart';
import 'package:vendors_app/features/authentication/register/view/add_food_items.dart';
import 'package:vendors_app/features/authentication/register/view/register_view.dart';
import 'package:vendors_app/features/authentication/register/view/set_menu.dart';

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
      home: SafeArea(bottom: false, child: RegisterView()),
      debugShowCheckedModeBanner: false,
      // debugShowMaterialGrid: true,
    );
  }
}
