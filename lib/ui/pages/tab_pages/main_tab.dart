import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cryptzz_app/business/constants/colors.dart';
import 'package:cryptzz_app/ui/widgets/currencies_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

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
    const CurrenciesWidget(),
    Container(),
    Container(),
    Container(),
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
        backgroundColor: darkBlue,
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.add_task_outlined,
              color: Colors.white,
            ),
            SizedBox(height: 2),
            Text(
              "Ödeme",
              style: TextStyle(color: Colors.white, fontSize: 11),
            )
          ],
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: icons,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          activeColor: mainOrange,
          inactiveColor: grey3,
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
    FeatherIcons.home,
    Icons.account_balance_wallet_outlined,
    FeatherIcons.mail,
    FeatherIcons.user
  ];
}
