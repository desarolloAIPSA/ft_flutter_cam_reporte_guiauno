import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../data/models/flow/reporte_uno_model.dart';

/// Example without a datasource
class DataTable2SimpleDemo extends StatelessWidget {
   final List<Reporte1Model> data;

  const DataTable2SimpleDemo({super.key, required this.data});


  @override
  Widget build(BuildContext context) {
    const List<DataColumn> lista = [
              DataColumn2(
                label: Text('Nro Guia'),
                size: ColumnSize.L,
              ),
              DataColumn(
                label: Text('Re RUC'),
              ),
              DataColumn(
                label: Text('Brevete'),
              ),
              DataColumn(
                label: Text('Placa 1'),
              ),
              DataColumn(
                label: Text('Fecha Emisión'),
                numeric: true,
              ),
              DataColumn(
                label: Text('Hora Emisión'),
                numeric: true,
              ),
            ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            columns: lista,
            rows: List<DataRow>.generate(
                data.length,
                (index) => DataRow(cells: [
                      DataCell(Text(data[index].grNroGuia)),
                      DataCell(Text(data[index].reNroDoc)),
                      DataCell(Text(data[index].brevete??'')),
                      DataCell(Text(data[index].placa1??'')),
                      DataCell(Text(data[index].grFecEmision??'')),
                      DataCell(Text(data[index].grHoraEmision??'')),
                    ]))),
      ),
    );
  }
}