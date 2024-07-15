import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_camera_overlay/flutter_camera_overlay.dart';
import 'package:flutter_camera_overlay/model.dart';

class CapturarCarteirinhaCam extends StatefulWidget {
  const CapturarCarteirinhaCam({super.key});

  @override
  _CapturarCarteirinhaCamState createState() => _CapturarCarteirinhaCamState();
}

class _CapturarCarteirinhaCamState extends State<CapturarCarteirinhaCam> {
  OverlayFormat format = OverlayFormat.cardID3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<CameraDescription>?>(
        future: availableCameras(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null) {
              return const Align(
                alignment: Alignment.center,
                child: Text(
                  'Nenhuma câmera encontrada',
                  style: TextStyle(color: Colors.black),
                ),
              );
            }
            return Container(
              color: Colors.black,
              child: CameraOverlay(
                snapshot.data!.first,
                CardOverlay.byFormat(format),
                (XFile file) => showDialog(
                  context: context,
                  barrierColor: Colors.transparent,
                  builder: (context) {
                    CardOverlay overlay = CardOverlay.byFormat(format);
                    return AlertDialog(
                      actionsAlignment: MainAxisAlignment.center,
                      backgroundColor:  Colors.white,
                      title: const Text('Confirmar',
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center),
                      actions: [
                        OutlinedButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                            File convertedFile = File(file.path);
                            Navigator.pop(context, convertedFile);
                          },
                          child: const Icon(Icons.check),
                        )
                      ],
                      content: SizedBox(
                        width: double.infinity,
                        child: AspectRatio(
                          aspectRatio: overlay.ratio!,                          
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                alignment: FractionalOffset.center,
                                image: FileImage(
                                  File(file.path),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                info:
                    'Posicione a Carteirinha dentro da área de captura e certifique-se que a imagem está perfeitamente legível.',
                label: 'Capturar Carteirinha',
              ),
            );
          } else {
            return const Align(
              alignment: Alignment.center,
              child: Text(
                'Obtendo câmeras',
                style: TextStyle(color: Colors.black),
              ),
            );
          }
        },
      ),
    ));
  }
}
