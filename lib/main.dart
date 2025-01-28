import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:parawarga_apps/routes/app_pages.dart';

import 'data/binding/binding_dependency.dart';
import 'theme/app_theme.dart';
import 'translations/app_translations.dart';
import 'utils/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await BindingDependency().dependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: theme(),
        title: appName.tr,
        debugShowCheckedModeBanner: (kReleaseMode) ? false : true,
        initialRoute: Routes.splash,
        getPages: AppPages.pages,
        translationsKeys: AppTranslation.translations,
        locale: Get.deviceLocale,
        fallbackLocale: const Locale('id', 'ID')
    );
  }
}