import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cryptzz_app/business/constants/colors.dart';
import 'package:cryptzz_app/ui/pages/account_wallet_page/account_wallet_page.dart';
import 'package:cryptzz_app/ui/pages/nft_screen/nft_detail_creen.dart';
import 'package:cryptzz_app/ui/pages/nft_screen/nft_main_screen.dart';
import 'package:cryptzz_app/ui/pages/tab_pages/pages/crypto_coins_showing.dart';
import 'package:cryptzz_app/ui/widgets/currencies_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _currentIndex = 0;
  bool isLoading = false;

  changeLoading() => setState(() => isLoading = !isLoading);

  final List<Widget> _pages = [
    NftMainScreen(),
    Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFF000000),
          Color(0xFF150050),
          Color(0xFF63F0071),
          Color(0xFF610094),
          Color.fromARGB(255, 146, 35, 206),
          Color.fromARGB(255, 161, 86, 201),
          Color.fromARGB(255, 187, 144, 211),
          Color.fromARGB(255, 210, 197, 217),
          Colors.white
        ],
      )),
    ),
    ShowCryptoCoinPage(),
    CardScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? CircularProgressIndicator(
              color: Colors.black,
            )
          : _pages[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(11, 12, 54, 1),
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FeatherIcons.code,
              color: Colors.white,
            ),
            SizedBox(height: 2),
            Text(
              "Cryptzz",
              style:
                  GoogleFonts.unifrakturMaguntia(fontStyle: FontStyle.normal),
            )
          ],
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: Colors.black,
          icons: icons,
          splashColor: Colors.white,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          activeColor: Color.fromARGB(255, 64, 65, 155),
          inactiveColor: Colors.white,
          activeIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i)),
    );

    // return PersistentTabView(
    //   context,
    //   navBarHeight: 72,
    //   navBarStyle: NavBarStyle.style15,
    //   decoration: NavBarDecoration(
    //     borderRadius: BorderRadius.circular(10.0),
    //     colorBehindNavBar: Colors.black,
    //   ),
    //   items: isLoading ? null : _navBarsItems(),
    //   screens: isLoading ? [buildCircularProgress()] : _buildScreens(),
    // );
  }

  // List<Widget> _buildScreens() {
  //   return [
  //     const Home(),
  //     const Transactions(),
  //     const AddInvoice(),
  //     const Notifications(),
  //     const Profile()
  //   ];
  // }

  List<IconData> icons = [
    FeatherIcons.creditCard,
    Icons.account_balance_wallet_outlined,
    FeatherIcons.grid,
    FeatherIcons.hexagon
  ];
}
