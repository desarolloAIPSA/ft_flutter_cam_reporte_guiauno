import 'package:reporte_guia/src/config/app_theme.dart';
import 'package:reporte_guia/src/presentation/screens/c_guia_terminada/visor_qr_screen.dart';
import 'package:reporte_guia/src/presentation/widgets/atomic/card_guia_term_widget.dart';
import 'package:flutter/material.dart';
import '../../../data/models/environment_model.dart';
import '../../../data/models/ora/guia_terminada_c1_model.dart';
import '../../../data/services/a_ora_service.dart';
import '../../../utils/formato_texto.dart';

class MaestroGTScreen extends StatefulWidget {
  final EnvironmentModel input;
  final Map<String, dynamic> queryParam;

  const MaestroGTScreen({super.key, required this.input, required this.queryParam});

  @override
  State<MaestroGTScreen> createState() => _MaestroGTScreenState();
}

class _MaestroGTScreenState extends State<MaestroGTScreen> {
  TextEditingController editingController = TextEditingController();
  List<GuiaTermoinadaC1Model> items2 = [];
  List<GuiaTermoinadaC1Model> duplicateItems2 = [];
  final oraService = OraService();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {

      /* final regisProv = Provider.of<RegisProv>(context, listen: false);
      final deviceProv = Provider.of<DevicePro>(context, listen: false); */
      debugPrint('TEST init State Maestro');
      cargar();
    });
    editingController.addListener(() {
      debugPrint('TEST editingController: ${editingController.text}');
    });
    super.initState();
  }

  @override
  void dispose() {
    editingController.dispose();
    super.dispose();
  }

  Future<void> cargar() async {
    final rpt = await oraService.listGuiaTerminada(input: widget.input, queryParam: widget.queryParam);
    setState(() {
      duplicateItems2 = rpt.data;
    items2 = duplicateItems2;
    });
    
  }

  void filterSearchResults(String query) {
    debugPrint('TEST editingController query: $query');
    setState(() {
      items2 = duplicateItems2.where((item) => item.grNroGuia.contains(query)).toList();
    });
  }

  void filterSearchManyResults(String query) {
    debugPrint('TEST editingController query: $query');

    List<GuiaTermoinadaC1Model> searchResults = duplicateItems2
        .where((item) =>
            item.grNroGuia.contains(query) ||
            item.grFecEmision.contains(query) ||
            item.grHoraEmision.contains(query) ||
            item.placa1.contains(query)
            //item.trRazonSocial.contains(query) 
            )
        .toList();
    setState(() {
      items2 = searchResults;
      debugPrint('TEST editingController items2: $items2');
    });
  }

  @override
  Widget build(BuildContext context) {
    //final formProv = Provider.of<FormProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('(C) Guías Terminadas'),
          backgroundColor: AppTheme.primaryColor,
          elevation: 0.0
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                inputFormatters: [UpperCaseTextFormatter()],
                onChanged: (value) {
                  filterSearchManyResults(value.toUpperCase());
                },
                controller: editingController,
                decoration: const InputDecoration(
                    labelText: "Búsqueda", hintText: "Búsqueda", prefixIcon: Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(105.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items2.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      if(items2[index].estadoEnvio=='4'){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => VisorQrScreen(data: items2[index]  ,)));
                      }
                      debugPrint('TEST press: ${items2[index].grNroGuia}');
                    },
                    child: Column(
                      children: [
                        CardGuiaTermW(
                          data: items2[index],
                          //color: AppTheme.primaryColor.withAlpha(50), 
                          icon: Icons.picture_as_pdf_rounded, 
                          isPdf: items2[index].estadoEnvio=='4'?true:false,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*

FutureBuilder<ApiModel<List<GuiaTermoinadaC1Model>>>(
          future: oraService.listGuiaTerminada(input: widget.input, queryParam: widget.queryParam),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              duplicateItems2 = snapshot.data!.data;
              items2 = duplicateItems2;

              return Container(
                  //color: Colors.pink.withAlpha(20),
                  //height: 500,
                  width: 400,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            filterSearchManyResults(value.toUpperCase());
                          },
                          controller: editingController,
                          decoration: const InputDecoration(
                              labelText: "Search", hintText: "Search", prefixIcon: Icon(Icons.search), border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: items2.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Container(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppTheme.primaryColor.withAlpha(50)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${items2[index].grNroGuia}'),
                                    Text('${items2[index].grFecEmision}'),
                                    Text('${items2[index].grHoraEmision}'),
                                    Text('${items2[index].hashQr}'),
                                    Text('${items2[index].nroRegistroSap}'),
                                    Text('${items2[index].operadorSap}'),
                                    Text('${items2[index].placa1}'),
                                    Text('${items2[index].reNroDoc}'),
                                    Text('${items2[index].trRazonSocial}'),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ));
            }
          }),
    ))
 */