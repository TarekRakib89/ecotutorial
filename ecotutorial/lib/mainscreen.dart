import 'package:ecotutorial/controller/mainscreenprovider.dart';
import 'package:ecotutorial/views/ui/addpage.dart';
import 'package:ecotutorial/views/ui/cartpage.dart';
import 'package:ecotutorial/views/ui/homepage.dart';
import 'package:ecotutorial/views/ui/profilepage.dart';
import 'package:ecotutorial/views/ui/searchpage.dart';
import 'package:ecotutorial/views/shared/bootom_nav.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List pageList = const [
    HomePage(),
    SearchPage(),
    AddPage(),
    CartPage(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenprovider>(
        builder: (context, mainScreenProvider, child) {
      return Scaffold(
        backgroundColor: const Color(0xFFF2E2E2),
        body: pageList[mainScreenProvider.pageIndex],
        bottomNavigationBar: const BootomNavbar(),
      );
    });
  }
}
