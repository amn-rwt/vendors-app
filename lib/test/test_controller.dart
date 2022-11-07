import 'dart:developer';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ntp/ntp.dart';

class TestController extends GetxController {
  late final DateTime? now;
  @override
  void onInit() {
    log('onInit');
    getTime();
    super.onInit();
  }

  getTime() async {
    now = await NTP.now();
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
