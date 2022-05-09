import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cryptzz_app/providers/currency_provider.dart';
import 'package:cryptzz_app/ui/pages/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/AppState.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CurrencyProvider(),
          ),
          ChangeNotifierProvider(create: (_) => AppState())
        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginScreen(),
          debugShowCheckedModeBanner: false,
        ),
      );
}

class AuthService {
  final FirebaseAuth auth;
  final FirebaseFirestore firebase;

  AuthService(this.auth, this.firebase);
}
