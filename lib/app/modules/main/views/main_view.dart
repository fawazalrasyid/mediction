import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mediction/app/modules/medical_record/views/medical_record_view.dart';
import 'package:mediction/app/modules/profile/views/profile_view.dart';
import 'package:mediction/app/modules/schedule/views/schedule_view.dart';

import '../../../core/values/app_colors.dart';
import '../../home/views/home_view.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  MainView({super.key});
  @override
  final MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex.value,
            children: [
              HomeView(),
              const MedicalRecordView(),
              const ScheduleView(),
              const ProfileView()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.white,
            currentIndex: controller.tabIndex.value,
            onTap: controller.changeTabIndex,
            selectedItemColor: AppColors.selectedNavbarIcon,
            unselectedItemColor: AppColors.navbarIcon,
            type: BottomNavigationBarType.fixed,
            iconSize: 24,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(IconlyLight.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.clipboard_text),
                label: 'Riwayat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.calendar_tick),
                label: 'Pengingat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.profile_circle),
                label: 'Profil',
              ),
            ],
          ),
        );
      },
    );
  }
}
