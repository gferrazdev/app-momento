import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/controllers/gps_controller.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/modules/validar_biometria/validar_biometria_controller.dart';
class ValidarBiometriaButtonQRCode extends StatefulWidget {
  const ValidarBiometriaButtonQRCode({super.key});

  @override
  State<ValidarBiometriaButtonQRCode> createState() =>
      _ValidarBiometriaButtonQRCodeState();
}

class _ValidarBiometriaButtonQRCodeState
    extends State<ValidarBiometriaButtonQRCode> {
  final controller = Get.find<ValidarBiometriaController>();
  final gpsController = Get.find<GPSController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.carregando.value
          ? Container()
          : Align(
              child: SizedBox(
                width: 900.w,
                height: 125.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: ThemeColors.roxoPadrao,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.h),
                    ),
                  ),
                  onPressed: () async {
                    debugPrint('ler QRCode');
                    String qrCode = await FlutterBarcodeScanner.scanBarcode(
                        '#2A99CF', 'Cancelar', true, ScanMode.QR);
                    if (!mounted) return;
                    debugPrint(qrCode);
                    Map<String, dynamic> retorno = {};
                    retorno = jsonDecode(qrCode);
                    controller.cdSolicitacao.value = retorno['cdSolicitacao'];  
                    controller.solicitacaoController.value.text = retorno['cdSolicitacao'];  
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Icon(
                            Icons.qr_code,
                            color: Colors.white,
                            size: 70.h,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80.w,
                      ),
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Ler QR Code",
                            style: ThemeTextStyles.getWhite45BoldStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
