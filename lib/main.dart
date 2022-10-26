import 'package:argo_spm/providers/analyze_provider.dart';
import 'package:argo_spm/providers/ble_provider.dart';
import 'package:argo_spm/providers/bottom_app_bar_provider.dart';
import 'package:argo_spm/providers/dc_stepper_provider.dart';
import 'package:argo_spm/providers/permission_provider.dart';
import 'package:argo_spm/providers/prefs_provider.dart';
import 'package:argo_spm/providers/spm_provider.dart';
import 'package:argo_spm/routes/route_generator.dart';
import 'package:argo_spm/routes/routes.dart';
import 'package:argo_spm/utils/themes/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();
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
        ChangeNotifierProvider<PrefsProvider>(
          create: (context) => PrefsProvider(),
        ),
        ChangeNotifierProvider<SpmProvider>(
          create: (context) => SpmProvider(),
        ),
        ChangeNotifierProvider<DcStepperProvider>(
          create: (context) => DcStepperProvider(),
        ),
        ChangeNotifierProvider<PermissionProvider>(
          create: (context) => PermissionProvider(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: [
          Locale('ko', 'KR'),
          Locale('en', 'US'),
        ],
        fallbackLocale: Locale('ko', 'KR'),
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

    // return ScreenUtilInit(
    //     designSize: const Size(1158, 800),
    //     minTextAdapt: true,
    //     splitScreenMode: true,
    //   builder: (context,child) {

    return MaterialApp(
      title: 'app_name'.tr(),
      theme: appThemeData[AppTheme.LightTheme],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        EasyLocalization.of(context)!.delegate,
      ],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.root,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
    //   }
    // );
  }
}
