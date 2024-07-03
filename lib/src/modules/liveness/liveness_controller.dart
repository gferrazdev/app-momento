import 'package:get/get.dart';
import 'package:momento/src/modules/liveness/liveness_service.dart';

class LivenessController extends GetxController {
  final LivenessService livenessService;
  LivenessController({required this.livenessService});
}
