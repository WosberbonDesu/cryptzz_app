import 'package:cryptzz_app/models/currency.dart';
import 'package:cryptzz_app/service/crypto_api/crypto_api.dart';
import 'package:cryptzz_app/utils/currecy_data_source.dart';
import 'package:flutter/cupertino.dart';

class CurrencyProvider extends ChangeNotifier {
  CurrencyDataSource? currencyDataSource;
  List<Currency> currencies = [];
  CurrencyProvider() {
    loadCurrencies();
  }
  Future loadCurrencies() async {
    final currencies = await CryptoApi.getCurrencies();
    this.currencies = currencies;
    currencyDataSource = CurrencyDataSource(currencies: currencies);
    notifyListeners();
  }
}
