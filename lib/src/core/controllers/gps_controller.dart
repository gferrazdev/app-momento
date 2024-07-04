import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ui/helpers/messages.dart';

class GPSController extends GetxController {
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var gpsDisponivel = false.obs;

  Future<bool> obterCoordenadas() async {
    try {
      await verificarPermissoes();

      if (gpsDisponivel.value) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        debugPrint('latitude: ${position.latitude}');
        debugPrint('longitude: ${position.longitude}');
        latitude.value = position.latitude;
        longitude.value = position.longitude;
        return true;
      } else {
        Get.snackbar(
            'Erro', 'Serviços de localização desativados ou sem permissão.');
        return false;
      }
    } catch (e) {
      Get.snackbar('Erro', e.toString());
      return false;
    }
  }

  Future<void> verificarPermissoes() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    gpsDisponivel.value = serviceEnabled;
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

    gpsDisponivel.value = true;
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
              permission != LocationPermission.deniedForever) {}
          Get.back();
        },
        opcaoNao: () {
          Get.back();
        });
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
        opcaoNao: () {
          Get.back();
        });
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
