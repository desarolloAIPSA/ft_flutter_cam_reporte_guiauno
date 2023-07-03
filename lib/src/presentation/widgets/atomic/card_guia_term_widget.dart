import 'package:flutter/material.dart';

import '../../../config/app_theme.dart';
import '../../../data/models/ora/guia_terminada_c1_model.dart';
import 'label_v5_widget.dart';

class CardGuiaTermW extends StatelessWidget {
  final GuiaTermoinadaC1Model data;
  final IconData icon;
  final bool isPdf;

  const CardGuiaTermW({super.key, required this.data, required this.icon, required this.isPdf});




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            width: size.width * 1,
            height: 180,
            /* decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(color: Colors.blue, style: BorderStyle.solid, width: 1.0),
            ), */
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  left: 20,
                  child: Container(
                    width: 350,
                    height: 170,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          AppTheme.primaryColor,
                          const Color(0xFF155799),
                        ],
                      ),
                      //color: color,
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(color: Colors.white70, style: BorderStyle.solid, width: 1.0),
                    ),
                    child: Container(
                      //margin: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            child: Text(
                              data.grNroGuia,
                              style: AppTheme.captionTitleMaestro,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                LabelV5W(color:Colors.white,icon: Icons.watch_outlined, value: '${data.grFecEmision} ${data.grHoraEmision}'),
                                LabelV5W(color:Colors.white,icon: Icons.rectangle_outlined , value: data.placa1),
                                //if(data.trRazonSocial!=null)LabelV5W(color:Colors.white,icon: Icons.home_work_outlined, value: data.nomTransportista),
                                if(data.nomTransportista!='')LabelV5W(color:Colors.white,icon: Icons.home_work_outlined, value: data.nomTransportista??''),
                              ],
                            ),
                          )
                          
                          //LabelV5W(icon: Icons.watch_outlined, value: '${data.grFecEmision}'),
                        ],
                      ),
                    ),
                  ),
                ),
                if (isPdf)
                  Positioned(
                    top: 20,
                    left: 300,
                    child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withAlpha(200)
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            icon,
                            size: 40,
                            color: AppTheme.rojo,
                          ),
                        )),
                  ),
                /* Positioned(
                  top: 65,
                  left: 10,
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 2),
                          blurRadius: 3,
                          spreadRadius: 0,
                        ),
                      ],
                      shape: BoxShape.circle,
                      color: Colors.white.withAlpha(220),
                    ),
                    child: Center(child: Text(letra,style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400
                    ),)),
                  )
                ), */
              ],
            ),
          ),
        ),
      ],
    );
  }
}
