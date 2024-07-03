import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:momento/src/modules/home/home_service.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/ui/helpers/messages.dart';

class HomeController extends GetxController {
  final HomeService homeService;
  HomeController({required this.homeService});
  var carregando = false.obs;

  void verificarPermissoes() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showLocationServicesDialog();
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showPermissionDeniedDialog();
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      _showPermissionDeniedForeverDialog();
      return;
    }
    verificaProximidade();
  }

  void verificaProximidade() async {
    debugPrint('verificaProximidade');
    carregando.value = true;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    debugPrint('latitude: ${position.latitude}');
    debugPrint('longitude: ${position.longitude}');
    bool valid = await homeService.sendPosition(
        latitude: position.latitude, longitude: position.longitude);
    if (valid) {
      Messages.exibeMensagemSucesso(
          titulo: 'Localização verificada', msg: 'Dentro da área de contrato');
    } else {
      Messages.exibeMensagemErro('Fora da área de contrato');
    }
    carregando.value = false;
  }

  void _showLocationServicesDialog() {
    Messages.exibeDefaultDialog(
        title: "Serviços de Localização Desativados",
        middleText: "Por favor, ative os serviços de localização.",
        onConfirm: "Configurações",
        onCancel: "Cancelar",
        opcaoSim: () async {
          await Geolocator.openLocationSettings();
          Get.back();
        },
        opcaoNao: () {});
  }

  void _showPermissionDeniedDialog() {
    Messages.exibeDefaultDialog(
        title: "Permissão de Localização Negada",
        middleText:
            "O aplicativo precisa de permissões de localização para funcionar corretamente.",
        onConfirm: "Permitir",
        onCancel: "Cancelar",
        opcaoSim: () async {
          LocationPermission permission = await Geolocator.requestPermission();
          if (permission != LocationPermission.denied &&
              permission != LocationPermission.deniedForever) {
            verificaProximidade();
          }
          Get.back();
        },
        opcaoNao: () {});
  }

  void _showPermissionDeniedForeverDialog() {
    Messages.exibeDefaultDialog(
        title: "Permissão de Localização Permanentemente Negada",
        middleText:
            "Por favor, vá até as configurações do aplicativo e permita o acesso à localização.",
        onConfirm: "Configurações",
        onCancel: "Cancelar",
        opcaoSim: () async {
          await launchAppSettings();
          Get.back();
        },
        opcaoNao: () {});
  }

  Future<void> launchAppSettings() async {
    final Uri settingsUri = Uri.parse('app-settings:');
    if (await canLaunchUrl(settingsUri)) {
      await launchUrl(settingsUri);
    } else {
      throw 'Could not open app settings';
    }
  }
}
