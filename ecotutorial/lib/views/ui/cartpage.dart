import 'package:ecotutorial/apppstyle.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Cart Page",
          style: appStyle(40, Colors.black, FontWeight.bold),
        ),
      ),
    );
  }
}