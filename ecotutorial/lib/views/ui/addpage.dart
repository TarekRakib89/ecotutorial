import 'package:ecotutorial/apppstyle.dart';
import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "AddPage",
          style: appStyle(40, Colors.black, FontWeight.bold),
        ),
      ),
    );
  }
}
