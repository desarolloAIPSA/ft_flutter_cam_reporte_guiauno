import 'package:reporte_guia/src/data/models/option_model.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _lightPrimaryColor = Colors.orange;
  static const Color _lightOnPrimaryColor = Colors.black;
  static const String fontFamily = 'Montserrat';

  static const Color _darkPrimaryColor = Colors.black;
  static const Color _darkPrimaryAppBarColor = Colors.white;
  //them for normal mode color
  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  //static const Color rose                   = Color(0xffF24E29);
  static const Color rose = Color(0xFFF25774);
  static const Color rosaLigth = Color(0x51ff9470);
  static const Color darkGrey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'WorkSans';

  static const primary1 = Color(0xFF3F5161);
  static const primary2 = Color(0xFF427CAC);
  static const primary3 = Color(0xFF91C8F6);
  static const primary4 = Color(0xFFEFF4F9);
  static const primary5 = Color(0xFFFFFFFF);
  static const primary6 = Color(0xFFFAFAFA);
  static const primary7 = Color(0xFFBFBFBF);
  static const primary8 = Color(0xFF333333);

  static const topContrast = Color(0xFF333333);
  static const bottonContrast = Color(0xFF333333);
  static const topLight = Color(0xFF333333);
  static const bottonLight = Color(0xFF333333);

  static const accent1 = Color(0xFFE09D00);
  static const accent2 = Color(0xFF0092D1);
  static const rojo = Color(0xffD93654);

  static Color _primaryColor = const Color(0xff01824A);
  //static Color _primaryColor = Color(0xff01824A);

  static Color get primaryColor => _primaryColor;

  static void setPrimaryColor(Option input) {
    switch (input.value) {
      case 'AGRO INDUSTRIAL PARAMONGA S.A.A':
        _primaryColor = const Color(0xff01824A);
        break;
      case 'EMPRESA AZUCARERA EL INGENIO S.A.':
        _primaryColor = const Color(0xFFE09D00);
        break;
      default:
    }
  }

  static final darkTheme = ThemeData(
    // scaffoldBackgroundColor: _darkPrimaryColor,
    appBarTheme: const AppBarTheme(
      color: _darkPrimaryAppBarColor,
      iconTheme: IconThemeData(color: _darkPrimaryColor),
    ),

    fontFamily: fontFamily,
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: _lightPrimaryColor,
    ),

    // TEXTS
    textTheme: const TextTheme(
      bodyText2: TextStyle(color: Colors.black),
      headline1: TextStyle(
        color: _darkPrimaryColor,
        fontSize: 96.0,
        letterSpacing: -1.5,
      ),
      headline2: TextStyle(
        color: _darkPrimaryColor,
        fontSize: 60.0,
        letterSpacing: -0.5,
      ),
      headline3: TextStyle(
        color: _darkPrimaryColor,
        fontSize: 48.0,
        letterSpacing: 0.0,
      ),
      headline4: TextStyle(
        color: _darkPrimaryColor,
        fontSize: 34.0,
        letterSpacing: 0.25,
      ),
      headline5: TextStyle(
        letterSpacing: 0.0,
        fontSize: 25.0,
      ),
      headline6: TextStyle(
        letterSpacing: 0.15,
        fontSize: 20.0,
      ),
    ),
  );

  static const TextTheme textTheme = TextTheme(
    headlineMedium: display1,
    headlineSmall: headline,
    titleLarge: title,
    titleSmall: subtitle,
    bodyMedium: body2,
    bodyLarge: body1,
    bodySmall: caption,
  );

  static const TextStyle display1 = TextStyle(
    // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle headlineLight = TextStyle(
    // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    letterSpacing: 0.27,
    color: primary6,
  );

  static const TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );
  static TextStyle body1White = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 15,
    letterSpacing: -0.05,
    color: Colors.white.withOpacity(0.4),
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

  static const TextStyle textDatePicker = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 20,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

  static const TextStyle title1 = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 17,
    wordSpacing: 2,
    letterSpacing: 0.4,
    color: lightText, // was lightText
  );

  //TextStyle(color: Colors.grey, fontSize: 17.0,fontWeight: FontWeight.w700,wordSpacing: 2),textAlign: TextAlign.center,)

  //DRAWER PANEL STYLE
  static const TextStyle drawerTitle = TextStyle(
    fontFamily: AppTheme.fontName,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: AppTheme.darkText,
  );

  static const TextStyle labelTitle = TextStyle(
    fontFamily: AppTheme.fontName,
    fontWeight: FontWeight.w600,
    fontSize: 19,
    color: AppTheme.darkText,
  );

  static const TextStyle estiloInput = TextStyle(
    fontSize: 23,
    letterSpacing: 7,
    fontWeight: FontWeight.w400,
    color: AppTheme.primary8,
  );

  static TextStyle temaMain(color) => TextStyle(
        fontSize: 25,
        letterSpacing: 5,
        fontWeight: FontWeight.bold,
        color: color,
      );
  static const TextStyle temaMainLigth =  TextStyle(
        fontSize: 25,
        letterSpacing: 5,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );
  static hintStyle() => TextStyle(
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        fontSize: 18,
        letterSpacing: 0.1,
        //color: darkText,
        color: topContrast.withAlpha(110),
      );

  static const TextStyle captionTitleMenu = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

  static const TextStyle captionTitleMaestro = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    letterSpacing: 0.2,
    color: Colors.white, // was lightText
  );

  static textBody3(Color color) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: color,
    letterSpacing: 1.5,
    fontFamily: 'Roboto',
  );

  static textBody3Bold(Color color) => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: color,
    letterSpacing: 1.5,
    fontFamily: 'Roboto',
  );

  //MaterialColor getColorFromHex(int hexColor) {
  static const Map<int, Color> colorMap = {
    50: Color(0xff01824A),
    100: Color(0xff01824A),
    200: Color(0xff01824A),
    300: Color(0xff01824A),
    400: Color(0xff01824A),
    500: Color(0xff01824A),
    600: Color(0xff01824A),
    700: Color(0xff01824A),
    800: Color(0xff01824A),
    900: Color(0xff01824A),
  };

//  return MaterialColor(hexColor, colorMap);
//}
}
