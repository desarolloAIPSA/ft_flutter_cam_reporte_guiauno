import 'package:reporte_guia/src/presentation/widgets/atomic/indicacion_widget.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../data/models/flow/qr_sunat_check_model.dart';
import '../../../data/models/ora/guia_terminada_c1_model.dart';

class VisorQrScreen extends StatelessWidget {
  final GuiaTermoinadaC1Model data;

  const VisorQrScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Guía Electrónica - SUNAT'),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: QrImageView(
                data: QrSunatCkeckModel(
                  nroGuia: data.grNroGuia, 
                  reNroDoc: data.reNroDoc, 
                  placa: data.placa1, 
                  feha: '${data.grFecEmision} ${data.grHoraEmision}', 
                  razonSocial: data.trRazonSocial??'', 
                  link: data.hashQr!
                ).toRawJson(),
                version: QrVersions.auto,
                size: 380,
                gapless: false,
              ),
            ),
            IndicacionW(icon: Icons.tips_and_updates,text: 'Muestre este código QR al chofer de la placa', subText: ': ${data.placa1}'),
            const IndicacionW(icon: Icons.star,text: 'Este QR contiene la ',subText: 'GUÍA ELECTRÓNICA',)
          ],
        ),
      ),
    );
  }
}
