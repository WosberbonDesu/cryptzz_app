import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../../../models/fetch_coin/data_model.dart';

class CoinLogoWidget extends StatelessWidget {
  final DataModel coin;
  String icon_names;
  CoinLogoWidget({
    Key? key,
    required this.icon_names,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var coinIconUrl =
        "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/";
    //TextTheme textStyle = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.only(left: 16.0),
      height: 96.0,
      width: 96.0,
      //78 Remaining
      child: Column(
        children: [
          Container(
              height: 50.0,
              width: 50.0,
              child: CachedNetworkImage(
                imageUrl: ((coinIconUrl + icon_names + ".png").toLowerCase()),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    SvgPicture.asset('assets/icons/dollar.svg'),
              )),
          const SizedBox(height: 4.0),
          Text(
            coin.symbol,
            style: TextStyle(color: Colors.red, fontSize: 10),
          ),
          const SizedBox(height: 2.0),
          RichText(
              text: TextSpan(children: [
            TextSpan(text: "\$", style: TextStyle(color: Colors.greenAccent)),
            TextSpan(
                text: coin.quoteModel.usdModel.price.toStringAsFixed(2),
                style: TextStyle(color: Colors.white, fontSize: 15))
          ])),
        ],
      ),
    );
  }
}
