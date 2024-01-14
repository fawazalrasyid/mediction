import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../core/values/app_values.dart';
import '../../../core/widgets/form_datetime_item.dart';
import '../../../core/widgets/form_dropdown_item.dart';
import '../../../core/widgets/form_item.dart';
import '../controllers/add_schedule_controller.dart';

class AddScheduleView extends GetView<AddScheduleController> {
  const AddScheduleView({Key? key}) : super(key: key);
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
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
                                    borderRadius: BorderRadius.circular(8),
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
                                text: "${controller.step.value + 1}",
                                style: const TextStyle(
                                  color: Color(0xFF238CE6),
                                  fontSize: 16,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const TextSpan(
                                text: ' / 2',
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
                        step1(),
                        step2(),
                      ],
                    ),
                    const SizedBox(height: 120),
                    CircularStepProgressIndicator(
                      totalSteps: 2,
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

  GridView step1() {
    return GridView.builder(
      itemCount: controller.menuNames.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 16 / 16,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => controller.selectMenu(index),
        child: Container(
          width: Get.width * 0.44,
          padding: const EdgeInsets.all(20),
          decoration: ShapeDecoration(
            color: controller.selectedMenu.value == index
                ? const Color(0xFFF1F6FB)
                : Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: controller.selectedMenu.value == index ? 1 : 0,
                color: controller.selectedMenu.value == index
                    ? const Color(0xFF238CE6)
                    : const Color(0xFFECF5FC),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                controller.menuImages[index],
                height: 64,
                width: 64,
              ),
              const SizedBox(height: 12),
              Text(
                controller.menuNames[index],
                textAlign: TextAlign.center,
                maxLines: 2,
                style: const TextStyle(
                  color: Color(0xFF003778),
                  fontSize: 16,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column step2() {
    return Column(
      children: [
        FormItem(
          controller: controller.fullNameCtrl,
          validator: controller.checkIsValidForm,
          label: "Kontrol apa?",
          hintLabel: "Tulis kontrol pemeriksaanmu",
          inputType: TextInputType.name,
          isRequired: true,
        ),
        const SizedBox(height: 20),
        FormDatetimeItem(
          controller: controller.idTypeCtrl,
          label: "Jadwal kontrol",
          hintLabel: 'Pilih waktu kontrol',
          isRequired: true,
          selectedValue: controller.selectedcontrolPeriode,
          onChanged: controller.onDropdownChanged,
        ),
        const SizedBox(height: 20),
        FormDropdownItem(
          controller: controller.idTypeCtrl,
          label: "Periode Kontrol",
          hintLabel: 'Pilih periode kontrol',
          isRequired: true,
          dropdownItems: controller.controlPeriode,
          selectedValue: controller.selectedcontrolPeriode,
          onChanged: controller.onDropdownChanged,
        ),
      ],
    );
  }
}
