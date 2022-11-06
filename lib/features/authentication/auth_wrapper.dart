import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vendors_app/features/home/home_view.dart';

import 'login/login_view.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return (FirebaseAuth.instance.currentUser == null)
        ? const LoginView()
        : HomeView();

  }
}
