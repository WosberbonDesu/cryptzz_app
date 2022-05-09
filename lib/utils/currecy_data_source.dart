/*

import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';
import '../models/currency.dart';

enum CurrencyColumn { id, rank, name, price, oneHChange, oneDChange, marketCap }

class CurrencyDataSource extends DataGridSource {
  late List<DataGridRow> _currencies;
  @override
  List<DataGridRow> get rows => _currencies;
  CurrencyDataSource({required List<Currency> currencies}) {
    buildDataGrid(currencies);
  }
  void buildDataGrid(List<Currency> currencies) => _currencies = currencies
      .map<DataGridRow>(
        (currency) => DataGridRow(
          cells: CurrencyColumn.values
              .map((column) => DataGridCell<CurrencyComparable>(
                  columnName: column.toString(),
                  value: CurrencyComparable(column, currency)))
              .toList(),
        ),
      )
      .toList();
  @override
  DataGridRowAdapter buildRow(DataGridRow row) => DataGridRowAdapter(
          cells: row.getCells().map<Widget>((dataGridCell) {
        final CurrencyComparable currencyWrapper = dataGridCell.value;
        final currency = currencyWrapper.currency;
        final column = CurrencyColumn.values
            .firstWhere((value) => value.toString() == dataGridCell.columnName);
        switch (column) {
          case CurrencyColumn.id:
            return buildIdRow(currency);
          case CurrencyColumn.price:
            return buildPriceRow(currency.price);
          case CurrencyColumn.marketCap:
            return buildMarketCap(currency);
          case CurrencyColumn.oneDChange:
            return buildOneDChange(currency);
          case CurrencyColumn.oneHChange:
            return buildOneHChange(currency);
          case CurrencyColumn.rank:
            return buildRank(currency);
          default:
            return Text("Hello", style: TextStyle(color: Colors.white));
        }
      }).toList());
  Widget buildRank(Currency currency) => Container(
        padding: EdgeInsets.all(12.0),
        child: Row(children: [
          Text(
            currency.marketCap.toString(),
            style: TextStyle(color: Colors.black),
          )
        ]),
      );
  Widget buildMarketCap(Currency currency) => Container(
        padding: EdgeInsets.all(12.0),
        child: Row(children: [
          Text(
            currency.marketCap.toString(),
            style: TextStyle(color: Colors.black),
          )
        ]),
      );
  Widget buildOneDChange(Currency currency) => Container(
        padding: EdgeInsets.all(12.0),
        child: Row(children: [
          Text(
            currency.oneHourChange.toString(),
            style: TextStyle(color: Colors.black),
          )
        ]),
      );
  Widget buildOneHChange(Currency currency) => Container(
        padding: EdgeInsets.all(12.0),
        child: Row(children: [
          Text(
            currency.marketCap.toString(),
            style: TextStyle(color: Colors.black),
          )
        ]),
      );

  Widget buildIdRow(Currency currency) => Container(
        padding: EdgeInsets.all(12.0),
        child: Row(children: [
          buildLogo(currency),
          SizedBox(
            width: 8,
          ),
          Text(
            currency.id,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
          ),
        ]),
      );
  Widget buildPriceRow(double price) => Container(
      padding: EdgeInsets.all(16),
      child: Text(
        "\$${price}",
        style: TextStyle(color: Colors.teal),
      ));

  Widget buildLogo(Currency currency) {
    final isSvg = currency.logoUrl.endsWith(".svg");
    return CircleAvatar(
      backgroundColor: Colors.black,
      child: isSvg
          ? SvgPicture.network(currency.logoUrl)
          : Image.network(currency.logoUrl),
      radius: 10,
    );
  }
}
*/