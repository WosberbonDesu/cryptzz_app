import 'package:cryptzz_app/business/constants/colors.dart';
import 'package:cryptzz_app/ui/pages/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../business/constants/global_context.dart';
import '../main.dart';
import '../ui/widgets/globalWidgets/show_snackbar.dart';

class AppState with ChangeNotifier {
  final AuthService? authService;

  AppState({
    required this.authService,
  }) {}

  double queryWidth =
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;

  double queryHeight =
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height;
  String dateTime = "";

  dynamic notifications;

  addTransaction(num price, int type, DateTime date) async {
    notifyListeners();
  }

// Hello

  /*
  Future getTransctions(String uid);
  getTransactions(String uidd) async {
    try {
      var returnType = await getTransctions(uidd);
      if (returnType is List<TransactionModel>) {
        user!.transactions = returnType;
      }
    } catch (e) {
      showSnackBar(NavigationService.navigatorKey.currentContext!,
          "Harcamalar alınamadı.",
          backgroundColor: PersonalColors.red);
    }
    notifyListeners();
  }
   */
  Route createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  navigatePushAndRemove(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(context, createRoute(page), (route) => false);
  }

  signOut() async {
    try {
      await FirebaseAuth.instance.signOut().then((value) =>
          navigatePushAndRemove(
              NavigationService.navigatorKey.currentContext!, LoginScreen()));
    } catch (e) {
      showSnackBar(NavigationService.navigatorKey.currentContext!,
          "Çıkış Yapılamadı.", justRed);
    }
    notifyListeners();
  }
}
