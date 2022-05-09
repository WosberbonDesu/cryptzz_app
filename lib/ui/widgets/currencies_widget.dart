import 'package:cryptzz_app/business/constants/colors.dart';
import 'package:cryptzz_app/providers/currency_provider.dart';
import 'package:cryptzz_app/utils/currecy_data_source.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
class CurrenciesWidget extends StatelessWidget {
  const CurrenciesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CurrencyProvider>(context);
    final currencyDataSource = provider.currencyDataSource;
    if (currencyDataSource == null) {
      return Center(
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    } else {
      print("buildGridColumns");
      return Padding(
        padding: EdgeInsets.only(top: 50),
        child: Container()
            //SfDataGrid(source: currencyDataSource, columns: buildGridColumns()),
      );
    }
  }


  Widget buildLabel(String text) => Text(
        text,
        style: TextStyle(color: Colors.black),
      );
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
      ];*/