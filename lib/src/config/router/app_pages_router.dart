import 'package:get/get.dart';
import 'package:poke_guarani/src/presentation/pages/favorites_page.dart';
import 'package:poke_guarani/src/presentation/pages/home_page.dart';
import 'package:poke_guarani/src/presentation/pages/info_page.dart';
import 'package:poke_guarani/src/presentation/pages/splash_page.dart';

import '../../di/binding/home_binding.dart';

abstract class AppPagesRouter {
  static final pages = <GetPage>[
    GetPage(name: PagesRoutes.infoRoute, page: () => InfoPage()),
    GetPage(name: PagesRoutes.favoritesRoute, page: () => const FavoritesPage()),
    GetPage(
        name: PagesRoutes.splashRoute,
        page: () => const SplashPage(),
        binding: HomeBinding()),
    GetPage(
        name: PagesRoutes.baseRoute,
        page: () => const HomePage(),
        binding: HomeBinding()),
  ];
}

abstract class PagesRoutes {
  static const String infoRoute = '/info';
  static const String favoritesRoute = '/favorite';
  static const String splashRoute = '/splash';
  static const String baseRoute = '/';
}
