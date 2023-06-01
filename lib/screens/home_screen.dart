import 'package:demakk_admin/screens/stalk_screen.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../widgets/app_bar_tile.dart';
import 'customers_screen.dart';
import 'drawer_component.dart';
import 'expense_screen.dart';
import 'history_screen.dart';
import 'orders_screen.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: const DrawerComponent(),
        body: PersistentTabView(
          context,
          screens: screens,
          controller: _controller,
          items: items,
          navBarStyle: NavBarStyle.style1,
          decoration: const NavBarDecoration(
            colorBehindNavBar: Color(0xFFFF6200),
          ),
        ),
      ),
    );
  }
}

List<PersistentBottomNavBarItem> items = <PersistentBottomNavBarItem>[
  PersistentBottomNavBarItem(
    icon: const Icon(
      Icons.home,
      color: Color(0xFFFF6200),
    ),
    textStyle: const TextStyle(color: primaryColor),
    title: amharic ? 'ትዕዛዞች' : 'Orders',
  ),
  PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.people,
        color: primaryColor,
      ),
      title: amharic ? 'ደንበኞች' : 'Customers'),
  PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.list_alt,
        color: primaryColor,
      ),
      title: amharic ? 'ዕቃዎች' : 'Stalk'),
  PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.monetization_on_outlined,
        color: primaryColor,
      ),
      title: amharic ? 'ወጪዎች' : 'Expenses'),
  // PersistentBottomNavBarItem(
  //     icon: const Icon(
  //       Icons.history,
  //       color: primaryColor,
  //     ),
  //     title: amharic ? 'ታሪክ' : 'History'),
];

List<Widget> screens = <Widget>[
  const OrdersScreen(),
  const CustomersScreen(),
  const StalkScreen(),
  ExpenseScreen(),
  //const HistoryScreen(),
];

//orders
//customers
//stalk
//expense
//history
