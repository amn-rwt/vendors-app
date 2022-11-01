import 'package:get/get.dart';
import 'package:vendors_app/features/authentication/login/login_view.dart';
import 'package:vendors_app/services/firebase_auth_services.dart';

class SettingsController extends GetxController {
  Future logout() async {
    FirebaseAuthServices.signOut()
        .then((value) => Get.to(() => const LoginView()));
  }
}
