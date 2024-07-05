import 'dart:io';
import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';

class FaceCameraScreen extends StatefulWidget {
  const FaceCameraScreen({super.key});

  @override
  State<FaceCameraScreen> createState() => _FaceCameraScreenState();
}

class _FaceCameraScreenState extends State<FaceCameraScreen> {
  late FaceCameraController controller;
  File? _capturedImage;

  @override
  void initState() {
    controller = FaceCameraController(
      autoCapture: true,
      imageResolution: ImageResolution.medium,
      defaultCameraLens: CameraLens.front,
      performanceMode: FaceDetectorMode.accurate,
      onCapture: (File? image) {
        if (image != null) {
          setState(() {
            _capturedImage = image;
          });
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Caputrar Foto',
          style: ThemeTextStyles.getWhite45BoldStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded,
              color: Colors.white, size: 45.h),
        ),
        backgroundColor: ThemeColors.roxoPadrao,
      ),
      body: Builder(builder: (context) {
        if (_capturedImage != null) {
          return Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.file(
                  _capturedImage!,
                  width: double.maxFinite,
                  fit: BoxFit.fitWidth,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 420.w,
                      height: 130.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor: ThemeColors.roxoEscuro,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.h),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context, _capturedImage);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.check),
                            Text(
                              'Confirmar',
                              textAlign: TextAlign.center,
                              style: ThemeTextStyles.getWhite45BoldStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 420.w,
                      height: 130.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor: ThemeColors.roxoEscuro,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.h),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _capturedImage = null;
                          });
                          SmartFaceCamera(
                            controller: controller,
                            messageBuilder: (context, face) {
                              if (face == null) {
                                return _message(
                                    'Fique de frente para o câmera');
                              }
                              if (!face.wellPositioned) {
                                return _message('Centralize seu rosto na tela');
                              }
                              return const SizedBox.shrink();
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.camera),
                            Text(
                              'Repetir',
                              textAlign: TextAlign.center,
                              style: ThemeTextStyles.getWhite45BoldStyle,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }
        return SmartFaceCamera(
          controller: controller,
          messageBuilder: (context, face) {
            if (face == null) {
              return _message('Fique de frente para o câmera');
            }
            if (!face.wellPositioned) {
              return _message('Centralize seu rosto na tela');
            }
            return const SizedBox.shrink();
          },
        );
      }),
    );
  }

  Widget _message(String msg) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
        child: Text(
          msg,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 14, height: 1.5, fontWeight: FontWeight.w400),
        ),
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
