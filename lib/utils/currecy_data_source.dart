import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';
import '../models/currency.dart';

enum CurrencyColumn { id, rank, name, price, oneHChange, oneDChange, marketCap }

class CurrencyDataSource extends DataGridSource {
  CurrencyDataSource({required List<Currency> currencies}) {
    buildDataGrid(currencies);
  }
  void buildDataGrid(List<Currency> currencies) => currencies.map<DataGridRow>(
        (currency) => DataGridRow(
          cells: CurrencyColumn.values
              .map((column) =>
                  DataGridCell(columnName: column.toString(), value: currency))
              .toList(),
        ),
      );
  @override
  DataGridRowAdapter buildRow(DataGridRow row) => DataGridRowAdapter(
          cells: row.getCells().map<Widget>((dataGridCell) {
        return Text("ss");
      }).toList());
}
