import 'package:reporte_guia/src/config/app_theme.dart';
import 'package:reporte_guia/src/presentation/widgets/atomic/generic_button_widget.dart';
import 'package:flutter/material.dart';
class CarConfirmW extends StatelessWidget {
  final void Function()? onConfirm;
  final void Function()? onCancel;
  final Column child;

  const CarConfirmW({super.key, this.onConfirm, this.onCancel, required this.child});


  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      //padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      height: null,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5,color: Colors.red.withAlpha(50)),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    color: AppTheme.rojo,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(margin: const EdgeInsets.symmetric(horizontal: 15),child: const Icon(Icons.delete_forever,size: 40,color: Colors.white,)),
                        Title(color: Colors.black, child: const Text("Confirmar Eliminación",style: TextStyle(fontSize: 18,color: Colors.white),)),
                      ],
                    )),
                ),
              ],
            ),
          ),
          //Divider(color: Colors.redAccent.withAlpha(100),thickness: 2.0,height: 20,),
          //SimpleLabelW(icon: Icons.key_outlined, label: 'Id', value: '1'),
          //SimpleLabelW(icon: Icons.key_outlined, label: 'Placa', value: '1'),
          Container(margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),child: child),
          Expanded(
            child: Row(
              children: [
                Container(margin: const EdgeInsets.symmetric(horizontal: 15),
                child: GenericButton(height: 55,width: 135, title: 'Continuar', color: Colors.green,onPressed:onConfirm),),
                Expanded(child: Container()),
                Container(margin: const EdgeInsets.symmetric(horizontal: 15),
                child: GenericButton(height: 55,width: 135, title: 'Eliminar', color: AppTheme.rojo,onPressed:onCancel),),
                
                
              ],
            ),
          )
        ],
      ),
    );
  }
}