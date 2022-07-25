import 'package:get/get.dart';
import 'package:swallet/module/introduction_page.dart';

import '../module/welcome_page.dart';

class Routes {
  static const initial = '/';

  static const welcome = '/welcome';

  static const intro = '/intro';
}

class AppPages {
  static final appPages = [
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: Routes.intro,
      page: () => const IntroductionPage(),
    ),
  ];
}
