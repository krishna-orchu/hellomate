import 'package:camera/camera.dart';

abstract class CameraRepository{
  Future<List<CameraDescription>> getAvailableCameras();
  Future<void> initializeCamera(CameraDescription cameraDescription);
  CameraController? getCameraController();
  Future<XFile?> takePicture();
  void dispose();
}