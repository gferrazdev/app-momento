import 'package:get/get.dart';
import 'package:momento/src/modules/home/home_bindings.dart';
import 'package:momento/src/modules/home/home_page.dart';
import 'package:momento/src/modules/login/login_bindings.dart';
import 'package:momento/src/modules/login/login_page.dart';
import 'package:momento/src/modules/web_view/webview_bindings.dart';
import 'package:momento/src/modules/web_view/webview_page.dart';

import '../../modules/liveness/liveness_bindings.dart';
import '../../modules/liveness/liveness_page.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: AppRoutes.WEBVIEW,
      page: () => const WebviewPage(),
      binding: WebviewBindings(),
    ),
    GetPage(
      name: AppRoutes.LIVENESS_CHECK,
      page: () => const LivenessPage(),
      binding: LivenessBindings(),
    ),
  ];
}
