import 'dart:developer';

import 'package:get/get_state_manager/get_state_manager.dart';

class TestController extends GetxController {
  @override
  void onInit() {
    log('onInit');
    super.onInit();
  }

  @override
  void onClose() {
    log('onClose');
    super.onClose();
  }

  @override
  void onReady() {
    log('onReady');
    super.onReady();
  }
}
