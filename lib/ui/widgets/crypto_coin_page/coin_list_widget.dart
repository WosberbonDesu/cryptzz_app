import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/chart_data_model.dart';
import '../../../models/fetch_coin/data_model.dart';
import '../../pages/tab_pages/pages/coin_detail_screen.dart';
import 'coin_chart_widget.dart';
import 'coin_logo_widget.dart';

class CoinListWidget extends StatelessWidget {
  final List<DataModel> coins;

  const CoinListWidget({
    Key? key,
    required this.coins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      "zec",
      "rep",
      "xmr",
      "eth",
      "algo",
      "ada",
      "eos",
      "xrp",
      "bch",
      "btc"
    ];

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Center(
              child: Text("Crypto Currency",
                  style: GoogleFonts.lobster(fontSize: 50)),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: ListView.builder(
              itemExtent: 160,
              itemCount: coins.length,
              itemBuilder: (context, index) {
                var coin = coins[index];
                var coinPrice = coin.quoteModel.usdModel;
                var data = [
                  ChartData(coinPrice.percentChange_90d, 2160),
                  ChartData(coinPrice.percentChange_60d, 1440),
                  ChartData(coinPrice.percentChange_30d, 720),
                  ChartData(coinPrice.percentChange_24h, 24),
                  ChartData(coinPrice.percentChange_1h, 1),
                ];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CoinDetailScreen(coin: coin)),
                    );
                  },
                  child: Container(
                    height: 160.0,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CoinLogoWidget(
                          coin: coin,
                          icon_names: icons[index],
                        ),
                        CoinChartWidget(
                          data: data,
                          coinPrice: coinPrice,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
