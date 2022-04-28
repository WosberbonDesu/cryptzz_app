import 'package:cryptzz_app/providers/AppState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowCryptoCoinPage extends StatefulWidget {
  ShowCryptoCoinPage({Key? key}) : super(key: key);

  @override
  State<ShowCryptoCoinPage> createState() => _ShowCryptoCoinPageState();
}

class _ShowCryptoCoinPageState extends State<ShowCryptoCoinPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void inisialize() async {
    var app = Provider.of<AppState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
