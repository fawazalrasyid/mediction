import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mediction/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final isLoading = false.obs;

  TextEditingController fullNameCtrl = TextEditingController();
  TextEditingController phoneNumberCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();

  TextEditingController idTypeCtrl = TextEditingController();

  TextEditingController guradianNameCtrl = TextEditingController();
  TextEditingController guardianStatusCtrl = TextEditingController();
  TextEditingController guradianAddressCtrl = TextEditingController();
  TextEditingController guradianPhoneNumberCtrl = TextEditingController();

  TextEditingController faskesTypeCtrl = TextEditingController();
  TextEditingController faskesIdCtrl = TextEditingController();

  TextEditingController alergiesCtrl = TextEditingController();
  TextEditingController aaCtrl = TextEditingController();

  late Rx<XFile?> idPhoto = Rx<XFile?>(null);
  late ImagePicker imagePicker;

  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;
  final chechkbox = false.obs;
  final isValidForm = false.obs;

  final step = 0.obs;
  final stepTitle = [
    '',
    'Sediakan Kartu Identitas Kamu',
    'Daftarkan Wali/Keluarga',
    'Fasilitas Kesehatan',
    'Alergi'
  ];

  final idTypes = ['KTP', 'Pasport'];
  final faskesTypes = [
    'BPJS',
  ];

  final isIdSelected = false.obs;
  String selectedIdType = '';

  final isFaskesSelected = false.obs;
  String selectedFaskesType = '';

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

  void pickIdPhoto() async {
    imagePicker = ImagePicker();

    try {
      idPhoto.value = await imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 500,
        maxHeight: 500,
        imageQuality: 80,
      );
    } catch (e) {
      idPhoto.value = null;
    }
    checkIsValidForm();
  }

  void onDropdownChanged(String value) {
    isIdSelected.value = true;
    selectedIdType = value;
  }

  void checkIsValidForm() {
    if (step.value.isEqual(0)) {
      isValidForm.value = fullNameCtrl.text.isNotEmpty &&
          phoneNumberCtrl.text.isNotEmpty &&
          passwordCtrl.text.isNotEmpty &&
          confirmPasswordCtrl.text.isNotEmpty &&
          passwordCtrl.text == confirmPasswordCtrl.text;
    } else if (step.value.isEqual(1)) {
      isValidForm.value = idPhoto.value != null;
    } else if (step.value.isEqual(2)) {
      isValidForm.value = guradianNameCtrl.text.isNotEmpty &&
          guardianStatusCtrl.text.isNotEmpty &&
          guradianAddressCtrl.text.isNotEmpty &&
          guradianPhoneNumberCtrl.text.isNotEmpty;
    } else if (step.value.isEqual(3)) {
      isValidForm.value = faskesIdCtrl.text.isNotEmpty;
    } else if (step.value.isEqual(4)) {}
  }

  void nextStep() {
    if (step < 3) {
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
    }
  }

  void register() {
    Get.toNamed(Routes.REGISTER_SUCCESS);
  }
}
