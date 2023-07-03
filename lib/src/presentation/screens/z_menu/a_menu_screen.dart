import 'package:reporte_guia/src/config/app_theme.dart';
import 'package:reporte_guia/src/presentation/screens/z_menu/c_configuracion_screen.dart';
import 'package:reporte_guia/src/presentation/screens/z_menu/b_profile_screen.dart';
import 'package:reporte_guia/src/presentation/screens/z_menu/d_tipo_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import '../../providers/a_login_provider.dart';
import '../../providers/form_prov.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final formProv = Provider.of<FormProvider>(context, listen: false);
      formProv.cargarTransportistas().then((value) {
        debugPrint('TEST CARGA value: $value');
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProv = Provider.of<LoginProvider>(context, listen: true);
    return SafeArea(
      child: WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        /* appBar: AppBar(
          automaticallyImplyLeading: false,
          title: SizedBox(
              width: double.infinity,
              child: Text(
                loginProv.selectedIndex == 1 ? 'Menu' : "Información Personal",
                style: AppTheme.headlineLight,
                textAlign: TextAlign.center,
              )),
          elevation: 0.0,
        ), */
        body: loginProv.selectedIndex == 2 ? const TipoFormScreen() :(loginProv.selectedIndex == 1? const ConfiguracionScreen():const ProfileScreen()),
        bottomNavigationBar: loginProv.cerrando? const SizedBox.shrink():Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: AppTheme.primaryColor.withAlpha(220),
            color: AppTheme.primaryColor,
            tabs: const [
              GButton(
                icon: LineIcons.user,
                text: 'Usuario',
              ),
              GButton(
                icon: LineIcons.cog,
                text: 'Configuración',
              ),
              GButton(
                icon: LineIcons.home,
                text: 'Menu',
              ),
            ],
            selectedIndex: loginProv.selectedIndex,
            onTabChange: (index) {
              debugPrint('TEST index: $index');
              loginProv.selectedIndex = index;
            },
          ),
        ),
      ),
    ));
  }
}
