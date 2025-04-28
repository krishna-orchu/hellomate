import 'package:camera/camera.dart';
import 'package:hellomate/domain/repositories/camera_repository.dart';

class CameraRepositoryImpl implements CameraRepository{
  CameraController? _cameraController;

  @override
  Future<List<CameraDescription>> getAvailableCameras() async {
    return await availableCameras();
  }

  @override
  Future<void> initializeCamera(CameraDescription cameraDescription) async {
    _cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
    );
    await _cameraController!.initialize();
  }

  @override
  CameraController? getCameraController() {
    return _cameraController;
  }

  @override
  void dispose() {
    _cameraController?.dispose();
  }

  @override
  Future<XFile?> takePicture() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      return await _cameraController!.takePicture();
    }
    return null;
  }

}