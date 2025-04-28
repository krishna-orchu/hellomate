import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../presentation/providers/camera_provider.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CameraViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Camera')),
    body: Column(
    children: [
    Expanded(
    child: Center(
    child: viewModel.isInitialized && viewModel.cameraController != null
    ? CameraPreview(viewModel.cameraController!)
        : const CircularProgressIndicator(),
    ),
    ),
    if (viewModel.capturedImage != null)
    SizedBox(
    height: 100,
    child: Image.file(File(viewModel.capturedImage!.path)),
    ),
    const SizedBox(height: 10),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    FloatingActionButton(
    onPressed: () => viewModel.setupCamera(),
    child: const Icon(Icons.camera),
    ),
    FloatingActionButton(
    onPressed: () => viewModel.takePhoto(),
    child: const Icon(Icons.camera_alt_outlined),
    ),
    ],
    ),
    const SizedBox(height: 20),
    ],
    ),
    );
  }
}
