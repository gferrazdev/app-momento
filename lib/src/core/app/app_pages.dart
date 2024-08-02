import 'package:get/get.dart';
import 'package:momento/src/modules/cadastrar_biometria/cadastrar_biometria_bindings.dart';
import 'package:momento/src/modules/cadastrar_biometria/cadastrar_biometria_page.dart';
import 'package:momento/src/modules/consulta_elegibilidade/consulta_elegibilidade_bindings.dart';
import 'package:momento/src/modules/consulta_elegibilidade/consulta_elegibilidade_page.dart';
import 'package:momento/src/modules/home/home_bindings.dart';
import 'package:momento/src/modules/home/home_page.dart';
import 'package:momento/src/modules/login/login_bindings.dart';
import 'package:momento/src/modules/login/login_page.dart';
import 'package:momento/src/modules/settings/settings_bindings.dart';
import 'package:momento/src/modules/settings/settings_page.dart';
import 'package:momento/src/modules/validar_biometria/validar_biometria_bindings.dart';
import 'package:momento/src/modules/validar_biometria/validar_biometria_page.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: AppRoutes.SETTINGS,
      page: () => const SettingsPage(),
      binding: SettingsBindings(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: AppRoutes.VERIFICAR_ELEGIBILIDADE,
      page: () => const ConsultaElegibilidadePage(),
      binding: ConsultaElegibilidadeBindings(),
    ),
    GetPage(
      name: AppRoutes.CADASTRAR_BIOMETRIA,
      page: () => const CadastrarBiometriaPage(),
      binding: CadastrarBiometriaBindings(),
    ),
    GetPage(
      name: AppRoutes.VERIFICAR_BIOMETRIA,
      page: () => const ValidarBiometriaPage(),
      binding: ValidarBiometriaBindings(),
    ),
  ];
}
