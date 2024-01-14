import 'package:get/get.dart';

class HomeController extends GetxController {
  final feelings = ['😄 Baik', '🤢 Tidak Baik', '🤒 Demam', '🤧 Flu'];

  final menuNames = [
    'Diary Kesehatan',
    'Cari Faskes',
  ];
  final menuDescrptions = [
    'Catat dan track kondisi kesehatan mandiri!',
    'Cari faskes terdekat sesuai kebutuhan!'
  ];
  final menuImages = [
    "assets/images/medical_report.png",
    "assets/images/scan_qr.png",
  ];
  final menuActions = [
    'Tulis Diary',
    'Cari Sekarang',
  ];

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
}
