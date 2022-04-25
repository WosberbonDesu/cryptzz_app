import 'dart:convert';

import '../../models/currency.dart';
import 'package:http/http.dart' as http;

class CryptoApi {
  static final key = "e9061432e623bc041dcfacfa986865b015586f32";

  static Future<List<Currency>> getCurrencies() async {
    final url =
        "https://api.nomics.com/v1/currencies/ticker?key=$key&ids=BTC,ETH,XRP&interval=1d,30d&convert=EUR&platform-currency=ETH&per-page=100&page=1";
    final response = await http.get(Uri.parse(url));
    final body = jsonDecode(response.body) as List;
    return body.map((item) => Currency.fromJson(item)).toList();
  }
}
