import 'package:agent_dart/agent_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mediction/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  final obscurePassword = true.obs;
  final chechkbox = false.obs;
  final isValidForm = false.obs;

  Identity? identity;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void toggleObscurePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  checkIsValidForm() {
    isValidForm.value =
        emailCtrl.text.isNotEmpty && passwordCtrl.text.isNotEmpty;
  }

  void login() {
    Get.offAllNamed(Routes.MAIN);
  }

  Future<void> authenticate() async {
    try {
      // var authClient = WebAuthProvider(
      //   scheme: "identity",
      //   path: 'auth',
      //   authUri: Uri.parse(''),
      //   useLocalPage: true,
      // );

      // await authClient.login(const AuthClientLoginOptions().canisterId);

      // var loginResult = await authClient.isAuthenticated();

      // identity = authClient.getIdentity();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }
}
