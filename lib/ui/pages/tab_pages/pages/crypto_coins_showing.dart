import 'package:cryptzz_app/models/fetch_coin/bid_data.dart';
import 'package:cryptzz_app/providers/AppState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/crypto_coin_page/widgets.dart';

//_TypeError (type 'BigDataModel' is not a subtype of type 'Future<BigDataModel>?'

class ShowCryptoCoinPage extends StatefulWidget {
  ShowCryptoCoinPage({Key? key}) : super(key: key);

  @override
  State<ShowCryptoCoinPage> createState() => _ShowCryptoCoinPageState();
}

class _ShowCryptoCoinPageState extends State<ShowCryptoCoinPage> {
  BigDataModel? data_model;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // inisialize();
  }

  Future<BigDataModel> inisialize() async {
    var app = Provider.of<AppState>(context, listen: false);
    data_model = await app.getCrypto();
    print(data_model);
    return data_model!;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BigDataModel>(
      future: inisialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            var coinsData = snapshot.data!.dataModel;
            return CoinListWidget(coins: coinsData);
          }
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
