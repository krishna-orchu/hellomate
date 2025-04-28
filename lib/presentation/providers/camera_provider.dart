import 'package:flutter/material.dart';
import '../../domain/repositories/camera_repository.dart';
import 'package:camera/camera.dart';

class CameraViewModel extends ChangeNotifier {
  final CameraRepository cameraRepository;
  CameraController? _cameraController;
  bool _isInitialized = false;

  CameraViewModel({required this.cameraRepository});

  bool get isInitialized => _isInitialized;
  CameraController? get cameraController => _cameraController;

  XFile? _capturedImage;
  XFile? get capturedImage => _capturedImage;

  Future<void> setupCamera() async {
    final cameras = await cameraRepository.getAvailableCameras();
    if (cameras.isNotEmpty) {
      await cameraRepository.initializeCamera(cameras[0]);
      _cameraController = cameraRepository.getCameraController();
      _isInitialized = _cameraController?.value.isInitialized ?? false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    cameraRepository.dispose();
    super.dispose();
  }

  Future<void> takePhoto() async {
    final photo = await cameraRepository.takePicture();
    if (photo != null) {
      _capturedImage = photo;
      notifyListeners();
    }
  }
}
