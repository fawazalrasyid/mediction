import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widgets/form_dropdown_item.dart';
import '../../../core/widgets/form_item.dart';
import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppValues.padding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    controller.step.value.isEqual(0)
                        ? Column(
                            children: [
                              const SizedBox(height: 32),
                              SizedBox(
                                width: Get.width * 0.2,
                                child: Image.asset(
                                    'assets/images/mediction_logo.png'),
                              ),
                              const SizedBox(height: 24),
                              const Text(
                                "Yuk Daftarkan Dirimu!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF080814),
                                  fontSize: 24,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Silahkan daftar untuk mengakses Mediction.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF52525B),
                                  fontSize: 14,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              const SizedBox(height: 18),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => controller.previousStep(),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                            width: 1,
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside,
                                            color: Color(0xFFDFE8F6),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          IconlyLight.arrow_left_2,
                                          size: 24,
                                          color: Color(0XFF030319),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "${controller.step.value}",
                                      style: const TextStyle(
                                        color: Color(0xFF238CE6),
                                        fontSize: 16,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' / 3',
                                      style: TextStyle(
                                        color: Color(0xFF848FAC),
                                        fontSize: 12,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                controller.stepTitle[controller.step.value],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF080814),
                                  fontSize: 20,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                    const SizedBox(height: 40),
                    IndexedStack(
                      index: controller.step.value,
                      children: [
                        step0(),
                        step1(),
                        step2(),
                        step3(),
                        step4(),
                      ],
                    ),
                    const SizedBox(height: 42),
                    controller.step.value.isEqual(0)
                        ? Column(
                            children: [
                              SizedBox(
                                width: Get.width,
                                child: ElevatedButton(
                                  onPressed: controller.isValidForm.value
                                      ? () => controller.nextStep()
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.colorPrimary,
                                    elevation: 0,
                                    padding: const EdgeInsets.fromLTRB(
                                        64, 16, 64, 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: controller.isLoading.value
                                      ? const SizedBox(
                                          height: 18,
                                          width: 18,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        )
                                      : const Text(
                                          "Selanjutnya",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'DM Sans',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              GestureDetector(
                                onTap: () => Get.toNamed(Routes.REGISTER),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sudah punya akun? ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF64748B),
                                        fontSize: 14,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "Masuk",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF3C8FE5),
                                        fontSize: 13,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : CircularStepProgressIndicator(
                            totalSteps: 3,
                            currentStep: controller.step.value,
                            stepSize: 2,
                            selectedColor: const Color(0xFF238CE6),
                            unselectedColor: const Color(0xFFF8F9FD),
                            padding: 0,
                            width: 80,
                            height: 80,
                            selectedStepSize: 2,
                            roundedCap: (_, __) => true,
                            child: GestureDetector(
                              onTap: controller.isValidForm.value
                                  ? () => controller.nextStep()
                                  : null,
                              child: Container(
                                width: 64,
                                height: 64,
                                margin: const EdgeInsets.all(8),
                                decoration: ShapeDecoration(
                                  color: controller.isValidForm.value
                                      ? const Color(0xFF003778)
                                      : const Color(0xFFA9B4CD),
                                  shape: const OvalBorder(),
                                ),
                                child: const Icon(
                                  IconlyBold.arrow_right_2,
                                  size: 38,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column step0() {
    return Column(
      children: [
        FormItem(
          controller: controller.fullNameCtrl,
          validator: controller.checkIsValidForm,
          label: "Nama Lengkap",
          hintLabel: "Tuliskan nama lengkap pasien",
          inputType: TextInputType.name,
          isRequired: true,
        ),
        const SizedBox(height: 20),
        FormItem(
          controller: controller.phoneNumberCtrl,
          validator: controller.checkIsValidForm,
          label: "No. Telepon",
          hintLabel: "Tulis no.telepon",
          inputType: TextInputType.number,
          isRequired: true,
        ),
        const SizedBox(height: 20),
        FormItem(
          controller: controller.passwordCtrl,
          obsecureText: controller.obscurePassword,
          validator: controller.checkIsValidForm,
          label: "Kata sandi",
          hintLabel: "Tulis kata sandi anda",
          inputType: TextInputType.visiblePassword,
          isRequired: true,
        ),
        const SizedBox(height: 20),
        FormItem(
          controller: controller.confirmPasswordCtrl,
          obsecureText: controller.obscureConfirmPassword,
          validator: controller.checkIsValidForm,
          label: "Ulangi Kata sandi",
          hintLabel: "Tulis ulang kata sandi anda",
          inputType: TextInputType.visiblePassword,
          isRequired: true,
        ),
      ],
    );
  }

  Column step1() {
    return Column(
      children: [
        FormDropdownItem(
          controller: controller.idTypeCtrl,
          label: "Tipe ID",
          hintLabel: 'Pilih tipe ID',
          isRequired: true,
          dropdownItems: controller.idTypes,
          selectedValue: controller.selectedIdType,
          onChanged: controller.onDropdownChanged,
        ),
        const SizedBox(height: 20),
        if (controller.isIdSelected.value)
          controller.idPhoto.value != null
              ? Column(
                  children: [
                    DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(12),
                      padding: const EdgeInsets.all(6),
                      color: const Color(0xffCFD0D8),
                      dashPattern: const [8, 8, 8, 8],
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        child: SizedBox(
                          height: 200,
                          width: Get.width,
                          child: Image.file(
                            File(controller.idPhoto.value!.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () => controller.pickIdPhoto(),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            IconlyBold.edit,
                            size: 16,
                            color: Color(0xff105997),
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Ubah Foto ID',
                            style: TextStyle(
                              color: Color(0xFF003778),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: controller.selectedIdType.isNotEmpty
                        ? () => controller.pickIdPhoto()
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.colorPrimary,
                      elevation: 0,
                      padding: const EdgeInsets.fromLTRB(64, 16, 64, 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? const SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            "Foto Identitas",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                  ),
                ),
      ],
    );
  }

  Column step2() {
    return Column(
      children: [
        FormItem(
          controller: controller.guradianNameCtrl,
          validator: controller.checkIsValidForm,
          label: "Nama Wali",
          hintLabel: "Tulis nama wali",
          inputType: TextInputType.name,
          isRequired: true,
        ),
        const SizedBox(height: 20),
        FormItem(
          controller: controller.guardianStatusCtrl,
          validator: controller.checkIsValidForm,
          label: "Status",
          hintLabel: "Cth : Ibu Kandung",
          inputType: TextInputType.text,
          isRequired: true,
        ),
        const SizedBox(height: 20),
        FormItem(
          controller: controller.guradianAddressCtrl,
          validator: controller.checkIsValidForm,
          label: "Alamat",
          hintLabel:
              "Cth : Jl. Margaasih no.35 Kecamatan Bojongsoang, Kab. Bandung",
          inputType: TextInputType.streetAddress,
          isRequired: true,
        ),
        const SizedBox(height: 20),
        FormItem(
          controller: controller.guradianPhoneNumberCtrl,
          validator: controller.checkIsValidForm,
          label: "Nomor Telepon",
          hintLabel: "Cth : +6287364xxxx",
          inputType: TextInputType.phone,
          isRequired: true,
        ),
      ],
    );
  }

  Column step3() {
    return Column(
      children: [
        FormDropdownItem(
          controller: controller.idTypeCtrl,
          label: "Jenis Faskes",
          hintLabel: 'Pilih jenis faskes',
          isRequired: true,
          dropdownItems: controller.faskesTypes,
          selectedValue: controller.selectedFaskesType,
          onChanged: controller.onDropdownChanged,
        ),
        const SizedBox(height: 20),
        FormItem(
          controller: controller.faskesIdCtrl,
          validator: controller.checkIsValidForm,
          label: "Nomor ID",
          hintLabel: "Cth : 9173739534594",
          inputType: TextInputType.number,
          isRequired: true,
        ),
      ],
    );
  }

  Column step4() {
    return Column(
      children: [
        FormItem(
          controller: controller.alergiesCtrl,
          validator: controller.checkIsValidForm,
          label: "Alergi",
          hintLabel: "Tulis nama wali",
          inputType: TextInputType.name,
          isRequired: true,
        ),
      ],
    );
  }
}
