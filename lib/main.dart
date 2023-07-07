// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:poke_guarani/src/config/router/app_pages_router.dart';
import 'package:poke_guarani/src/presentation/controllers/home_controller.dart';

import 'src/data/hive/favorites_hive.dart';
import 'src/utils/constants/strings.dart';

late Box box;
Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FavoritesHiveAdapter());
  await Hive.openBox<FavoritesHive>('data');

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Get.put(HomeController());

  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => 
       GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        initialRoute: PagesRoutes.baseRoute,
        getPages: AppPagesRouter.pages,
      ),
    );
  }
}
