import 'package:argo_spm/providers/ble_provider.dart';
import 'package:argo_spm/routes/route_generator.dart';
import 'package:argo_spm/routes/routes.dart';
import 'package:argo_spm/utils/themes/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<BleProvider>(
          create: (context) => BleProvider(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ko', 'KR'),
        ],
        fallbackLocale: Locale('en', 'US'),
        path: 'assets/languages',
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appThemeData[AppTheme.LightTheme],
      localizationsDelegates: [],
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
