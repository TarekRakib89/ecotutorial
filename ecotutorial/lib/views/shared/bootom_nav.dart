import 'package:ecotutorial/controller/mainscreenprovider.dart';
import 'package:ecotutorial/widget/botomwiget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BootomNavbar extends StatelessWidget {
  const BootomNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenprovider>(
        builder: (context, mainScreenProvider, child) {
      return SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            BottomNavWidget(
              onTap: () {
                mainScreenProvider.pageIndex = 0;
              },
              icon: mainScreenProvider.pageIndex == 0
                  ? Icons.home
                  : Icons.home_outlined,
            ),
            BottomNavWidget(
              onTap: () {
                mainScreenProvider.pageIndex = 1;
              },
              icon: mainScreenProvider.pageIndex == 1
                  ? Icons.search
                  : Icons.search_off_outlined,
            ),
            BottomNavWidget(
              onTap: () {
                mainScreenProvider.pageIndex = 2;
              },
              icon: mainScreenProvider.pageIndex == 2
                  ? Icons.add
                  : Icons.add_outlined,
            ),
            BottomNavWidget(
              onTap: () {
                mainScreenProvider.pageIndex = 3;
              },
              icon: mainScreenProvider.pageIndex == 3
                  ? Icons.shopping_cart
                  : Icons.shopping_cart_outlined,
            ),
            BottomNavWidget(
              onTap: () {
                mainScreenProvider.pageIndex = 4;
              },
              icon: mainScreenProvider.pageIndex == 0
                  ? Icons.person
                  : Icons.person_outlined,
            ),
          ]),
        ),
      ));
    });
  }
}
