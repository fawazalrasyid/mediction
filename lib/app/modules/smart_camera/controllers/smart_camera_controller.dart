import 'package:camera/camera.dart';
import 'package:get/get.dart';

class SmartCameraController extends GetxController {
  final isScanning = false.obs;
  final isInitializeCamera = false.obs;

  late Rx<XFile?> objectImage = Rx<XFile?>(null);

  List<CameraDescription>? cameras;
  CameraController? cameraCtrl;
  XFile? image;

  @override
  void onInit() {
    loadCamera();
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

  loadCamera() async {
    cameras = await availableCameras();

    if (cameras!.isNotEmpty) {
      cameraCtrl = CameraController(
        cameras![0],
        ResolutionPreset.max,
        enableAudio: false,
      );

      cameraCtrl!.initialize().then((_) {
        isInitializeCamera.value = true;
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              // Fluttertoast.showToast(msg: "Camera permissions are denied");
              isInitializeCamera.value = false;
              break;
            default:
              // Fluttertoast.showToast(msg: "Terjadi masalah, coba lagi");
              isInitializeCamera.value = false;
              break;
          }
        }
      });
    }
  }
}
