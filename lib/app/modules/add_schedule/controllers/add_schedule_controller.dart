import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class AddScheduleController extends GetxController {
  final isLoading = false.obs;

  TextEditingController fullNameCtrl = TextEditingController();
  TextEditingController phoneNumberCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();

  TextEditingController idTypeCtrl = TextEditingController();

  final isValidForm = false.obs;

  final selectedMenu = 1.obs;

  final step = 0.obs;
  final stepTitle = [
    'Tambahkan Pengingat',
    'Detail Pengingat',
  ];

  final menuNames = [
    'Kontrol\nDokter',
    'Minum\nObat',
    'Pengingat\nMakan',
  ];
  final menuImages = [
    "assets/images/rapid_test.png",
    "assets/images/drugs.png",
    "assets/images/mortar.png",
  ];

  final controlPeriode = ['Setiap Minggu', 'Setiap Bulan'];

  String selectedcontrolPeriode = '';

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

  void selectMenu(int index) {
    selectedMenu.value = index;
    checkIsValidForm();
  }

  void onDropdownChanged(String value) {}

  void checkIsValidForm() {
    if (step.value.isEqual(0)) {
      isValidForm.value = selectedMenu >= 0;
    } else if (step.value.isEqual(1)) {}
  }

  void nextStep() {
    if (step < 1) {
      step.value += 1;
      checkIsValidForm();
    } else {
      register();
    }
  }

  void previousStep() {
    if (step > 0) {
      step.value -= 1;
      checkIsValidForm();
    } else {
      Get.back();
    }
  }

  void register() {
    Get.toNamed(Routes.MAIN);
  }
}
