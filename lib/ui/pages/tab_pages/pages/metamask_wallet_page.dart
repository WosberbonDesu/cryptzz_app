import 'package:cryptzz_app/ui/widgets/globalWidgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../../../utils/ethereum_wallet_utils.dart';

import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../widgets/globalWidgets/custom_container_widgets.dart';

class MetamaskWalletPage extends StatefulWidget {
  const MetamaskWalletPage({Key? key}) : super(key: key);

  @override
  State<MetamaskWalletPage> createState() => _MetamaskWalletPageState();
}

class _MetamaskWalletPageState extends State<MetamaskWalletPage> {
  EthereumUtils ethUtils = EthereumUtils();

  double? _value = 0.0;

  var _data;

  @override
  void initState() {
    ethUtils.initial();
    ethUtils.getBalance().then((value) {
      _data = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.withOpacity(.9),
      appBar: AppBar(
        title: Text("DAPP"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: BoxDecoration(
                color: Colors.deepPurple..withOpacity(.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Text(
                        "Current Balance",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      _data == null
                          ? CircularProgressIndicator()
                          : Text(
                              "${_data}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white),
                            )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SfSlider(
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
              interval: 1,
              activeColor: Colors.white,
              enableTooltip: true,
              stepSize: 1.0,
              showLabels: true,
              min: 0.0,
              max: 10.0,
            ),
            SizedBox(
              height: 40,
            ),
            CustomContainerButtonWidget(
                title: "Get Balance",
                color: Colors.green,
                onTap: () {
                  ethUtils.getBalance().then((value) {
                    _data = value;
                    setState(() {});
                  });
                }),
            SizedBox(
              height: 40,
            ),
            CustomContainerButtonWidget(
                title: "Send",
                color: Colors.deepPurpleAccent,
                onTap: () async {
                  await ethUtils.sendBalance(_value!.toInt());
                  if (_value == 0) {
                    incorrectValueDialogBox(context);
                  } else {
                    sendDialogBox(context);
                  }
                }),
            SizedBox(
              height: 40,
            ),
            CustomContainerButtonWidget(
                title: "WithDraw",
                color: Colors.deepOrange,
                onTap: () async {
                  await ethUtils.withDrawBalance(_value!.toInt());

                  if (_value == 0) {
                    incorrectValueDialogBox(context);
                  } else {
                    withDrawDialogBox(context);
                  }
                }),
          ],
        ),
      ),
    );
  }

  incorrectValueDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Invalid Value',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            content: const Text('Please put a value greater then 0.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                )),
            actions: [
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  sendDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Thanks for your Transaction",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  withDrawDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Thanks for your Withdrawal",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
