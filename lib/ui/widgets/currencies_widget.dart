import 'package:cryptzz_app/utils/currecy_data_source.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CurrenciesWidget extends StatelessWidget {
  const CurrenciesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(source: currencyDataSource, columns: buildGridColumns());
  }

  List<GridColumn> buildGridColumns() => <GridColumn>[
        GridColumn(
          columnName: CurrencyColumn.id.toString(),
          label: buildLabel("ID"),
        ),
        GridColumn(
          columnName: CurrencyColumn.rank.toString(),
          maximumWidth: 80,
          label: buildLabel("Rank"),
        ),
        GridColumn(
          columnName: CurrencyColumn.name.toString(),
          label: buildLabel("Name"),
        ),
        GridColumn(
          columnName: CurrencyColumn.price.toString(),
          label: buildLabel("Price"),
        ),
        GridColumn(
          columnName: CurrencyColumn.oneHChange.toString(),
          label: buildLabel("Last1h"),
        ),
        GridColumn(
          columnName: CurrencyColumn.oneDChange.toString(),
          label: buildLabel("Last1D"),
        ),
        GridColumn(
          columnName: CurrencyColumn.marketCap.toString(),
          label: buildLabel("MarketCap"),
        ),
      ];
  Widget buildLabel(String text) => Text(
        text,
      );
}
