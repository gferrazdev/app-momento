import 'package:get/get.dart';
import 'package:momento/src/modules/web_view/webview_controller.dart';

class WebviewBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(WebviewController());
  }
}
