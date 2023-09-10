import 'package:ecotutorial/models/product.dart';
import 'package:ecotutorial/views/shared/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePageProduct extends StatefulWidget {
  List<Products> productList;

  HomePageProduct({
    super.key,
    required this.productList,
  });

  @override
  State<HomePageProduct> createState() => _HomePageProductState();
}

class _HomePageProductState extends State<HomePageProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 250, 250, 250),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.64,
            mainAxisSpacing: 10,
            crossAxisSpacing: 5,

            // childAspectRatio: 2,
          ),
          itemCount: widget.productList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final Products prodcut = widget.productList[index];
            return ChangeNotifierProvider<Products>.value(
                value: prodcut,
                child: ProductCard(
                  price: prodcut.price.toString(),
                  category: prodcut.category!.name.toString(),
                  id: prodcut.id.toString(),
                  name: prodcut.title.toString(),
                  image: prodcut.images![0],
                ));
          }),
    );
  }
}
