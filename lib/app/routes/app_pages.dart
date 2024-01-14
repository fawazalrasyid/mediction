import 'package:get/get.dart';

import '../modules/add_schedule/bindings/add_schedule_binding.dart';
import '../modules/add_schedule/views/add_schedule_view.dart';
import '../modules/coming_soon/bindings/coming_soon_binding.dart';
import '../modules/coming_soon/views/coming_soon_view.dart';
import '../modules/detail_medical_record/bindings/detail_medical_record_binding.dart';
import '../modules/detail_medical_record/views/detail_medical_record_view.dart';
import '../modules/health_analysis/bindings/health_analysis_binding.dart';
import '../modules/health_analysis/views/health_analysis_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/medical_record/bindings/medical_record_binding.dart';
import '../modules/medical_record/views/medical_record_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/register_success/bindings/register_success_binding.dart';
import '../modules/register_success/views/register_success_view.dart';
import '../modules/schedule/bindings/schedule_binding.dart';
import '../modules/schedule/views/schedule_view.dart';
import '../modules/smart_camera/bindings/smart_camera_binding.dart';
import '../modules/smart_camera/views/smart_camera_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.COMING_SOON,
      page: () => const ComingSoonView(),
      binding: ComingSoonBinding(),
    ),
    GetPage(
      name: _Paths.MEDICAL_RECORD,
      page: () => const MedicalRecordView(),
      binding: MedicalRecordBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE,
      page: () => const ScheduleView(),
      binding: ScheduleBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_MEDICAL_RECORD,
      page: () => const DetailMedicalRecordView(),
      binding: DetailMedicalRecordBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_SUCCESS,
      page: () => const RegisterSuccessView(),
      binding: RegisterSuccessBinding(),
    ),
    GetPage(
      name: _Paths.ADD_SCHEDULE,
      page: () => const AddScheduleView(),
      binding: AddScheduleBinding(),
    ),
    GetPage(
      name: _Paths.SMART_CAMERA,
      page: () => const SmartCameraView(),
      binding: SmartCameraBinding(),
    ),
    GetPage(
      name: _Paths.HEALTH_ANALYSIS,
      page: () => const HealthAnalysisView(),
      binding: HealthAnalysisBinding(),
    ),
  ];
}
