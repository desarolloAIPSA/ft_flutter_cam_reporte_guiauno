
// ignore_for_file: constant_identifier_names
import 'dart:ui';
import 'package:reporte_guia/src/config/app_theme.dart';
import 'package:reporte_guia/src/presentation/screens/b_guia_proceso/maestro_screen.dart';
import 'package:reporte_guia/src/presentation/screens/screens.dart';
import 'package:reporte_guia/src/presentation/providers/z_providers.dart';
import 'package:reporte_guia/src/presentation/screens/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
//import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main() async{
  /* SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor:  Color(0xffffffff), // navigation bar color
    statusBarColor: Color(0xfff27052), /// status bar color
  )); */
  runApp(const MyApp());
}

mixin AppLocale {
  static const String title = 'title';
  static const Map<String, dynamic> EN = {title: 'Localization'};
  static const Map<String, dynamic> ES = {title: 'Localización en Perú'};
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization localization = FlutterLocalization.instance;
  
  @override
  void initState() {
      localization.init(
          mapLocales: [
              const MapLocale('en', AppLocale.EN),
              const MapLocale('es', AppLocale.ES),
          ],
          initLanguageCode: 'es',
      );
      localization.onTranslatedLanguage = _onTranslatedLanguage;
      
      super.initState();
  }

// the setState function here is a must to add
void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
}

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> LoginProvider()),
        ChangeNotifierProvider(create: (_)=> EnviromentProvider()),
        ChangeNotifierProvider(create: (_)=> RegisProv()),
        ChangeNotifierProvider(create: (_)=> CasosProv()),
        ChangeNotifierProvider(create: (_)=> DevicePro()),
        ChangeNotifierProvider(create: (_)=> FormProvider()),
        ChangeNotifierProvider(create: (_)=> LoadProv()),
        
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}),
        theme: ThemeData(
          primarySwatch:  const MaterialColor(0xff01824A, AppTheme.colorMap),
          scrollbarTheme: ScrollbarThemeData(
            thumbColor:  MaterialStateProperty.all(Colors.grey),
            trackColor: MaterialStateProperty.all(Colors.grey[200]),
            trackBorderColor: MaterialStateProperty.all(Colors.grey[200]),
          ),
        ),
        initialRoute: 'empresa',
        routes: {
          'login'       :(_)=> const LoginPage(),
          'multiform'   :(_)=> const MultiformPage(title: "Formulario"),
          'test'        :(_)=> const TestPage(),
   
          'menu'        :(_)=> const MenuScreen(),
          'maestro'     :(_)=> const MaestroScreen(),
          'empresa'     :(_)=> const SelectEmpresa(),

          
        },
        supportedLocales: localization.supportedLocales,
        localizationsDelegates: localization.localizationsDelegates,
      ),
    );
  }
}

