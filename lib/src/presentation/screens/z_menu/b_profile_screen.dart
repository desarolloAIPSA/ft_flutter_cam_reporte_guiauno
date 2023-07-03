// ignore_for_file: use_build_context_synchronously
import 'package:reporte_guia/src/config/app_theme.dart';
import 'package:reporte_guia/src/presentation/screens/a_login.dart';
import 'package:reporte_guia/src/presentation/widgets/atomic/label_v4_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/a_login_provider.dart';
import '../../widgets/atomic/icon_button_widget.dart';
import '../../widgets/atomic/loading_indicator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: true);
    return loginProvider.cerrando
      ? const LoadingIndicator(
          texto: "Cerrando Sesión",
        )
      :Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const SizedBox(
            width: double.infinity,
            child: Text(
              "Información Personal",
              style: AppTheme.headlineLight,
              textAlign: TextAlign.center,
            )),
        backgroundColor: AppTheme.primaryColor,
        elevation: 0.0
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Container(alignment: Alignment.centerLeft,margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),child: Text('',style: AppTheme.labelTitle,)),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Container(
                    height: 130,
                    width: 130,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(color: Colors.grey.withAlpha(50), borderRadius: BorderRadius.circular(100)),
                    //margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                    child: Center(
                      child: Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.grey.withAlpha(255),
                    ))),
                Expanded(
                  child: Column(
                    children: [
                      Container(margin: const EdgeInsets.only(bottom: 10),child: LabelV4W(title: 'Usuario:', value: loginProvider.auth.user)),
                      LabelV4W(title: 'Nombre:', value: loginProvider.auth.nombre)
                    ],
                  ),
                )
                
              ],
            ),
          ),

          //const LabelV3W(title: '"Centro de ayuda"', value: "987654321", icon: Icons.help_outline_sharp),
          //LabelV3W(title: '"Centro de ayuda"', value: "987654321", icon: Icons.help_outline_sharp),
          Expanded(child: Container()),
          ImageButton(
            onPressed: () async {
              loginProvider.cerrando = true;
              debugPrint('TEST botonsalir');
              await Future.delayed(const Duration(milliseconds: 1000));
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              loginProvider.cerrando = false;

            },
            icon: Icons.logout_outlined,
            color: Colors.red,
            title: 'Salir',
            width: 300,
          )
        ],
      ),
    );
  }
}
