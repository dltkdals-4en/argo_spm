import 'package:argo_spm/providers/analyze_provider.dart';
import 'package:argo_spm/providers/ble_provider.dart';
import 'package:argo_spm/providers/bottom_app_bar_provider.dart';
import 'package:argo_spm/providers/share_provider.dart';
import 'package:argo_spm/providers/spm_provider.dart';
import 'package:argo_spm/routes/route_generator.dart';
import 'package:argo_spm/routes/routes.dart';
import 'package:argo_spm/utils/themes/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        ChangeNotifierProvider<AnalyzeProvider>(
          create: (context) => AnalyzeProvider(),
        ),
        ChangeNotifierProvider<BottomAppBarProvider>(
          create: (context) => BottomAppBarProvider(),
        ),
        ChangeNotifierProvider<ShareProvider>(
          create: (context) => ShareProvider(),
        ),
        ChangeNotifierProvider<SpmProvider>(
          create: (context) => SpmProvider(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: [
          Locale('ko', 'KR'),
          Locale('en', 'US'),
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
    return ScreenUtilInit(
        designSize: const Size(1158, 800),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context,child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: appThemeData[AppTheme.LightTheme],
          localizationsDelegates: [
            EasyLocalization.of(context)!.delegate,
          ],
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.home,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      }
    );
  }
}
