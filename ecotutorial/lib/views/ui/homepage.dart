import 'package:ecotutorial/apppstyle.dart';
import 'package:ecotutorial/models/product.dart';
import 'package:ecotutorial/services/api_handler.dart';
import 'package:ecotutorial/views/shared/product_card.dart';
import 'package:ecotutorial/views/ui/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _controller = TabController(length: 3, vsync: this);
  List<Products> products = [];
  APIHandler apiHandler = APIHandler();

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getProducts();
  }

  Future<void> getProducts() async {
    products = await apiHandler.getAllProducts();
    print(products[0].price);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/img1.jpg",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 8,
                    bottom: 15,
                  ),
                  width: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Athletics Ahoes",
                          style: appStyleWidthHt(
                              35, Colors.white, FontWeight.bold, 1.5)),
                      Text(
                        "Collection",
                        style: appStyleWidthHt(
                            35, Colors.white, FontWeight.bold, 1.2),
                      ),
                      TabBar(
                          padding: const EdgeInsets.all(0),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.transparent,
                          controller: _controller,
                          isScrollable: true,
                          labelColor: Colors.white,
                          labelStyle:
                              appStyle(24, Colors.white, FontWeight.bold),
                          unselectedLabelColor: Colors.grey.withOpacity(0.3),
                          tabs: const [
                            Tab(
                              text: "Clothes",
                            ),
                            Tab(
                              text: "Women Shoes",
                            ),
                            Tab(
                              text: "Kids Shoes",
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25),
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: TabBarView(controller: _controller, children: [
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.405,
                          child: ListView.builder(
                              itemCount: products.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final Products prodcut = products[index];
                                return ChangeNotifierProvider<Products>.value(
                                    value: prodcut,
                                    child: ProductCard(
                                      price: prodcut.price.toString(),
                                      category:
                                          prodcut.category!.name.toString(),
                                      id: prodcut.id.toString(),
                                      name: prodcut.title.toString(),
                                      image: prodcut.images![0],
                                    ));
                              }),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(12, 20, 12, 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Latest Shows",
                                    style: appStyle(
                                        24, Colors.black, FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProductPage(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Show all",
                                          style: appStyle(22, Colors.black,
                                              FontWeight.w500),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_drop_down,
                                        size: 35,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.13,
                          child: ListView.builder(
                              itemCount: 6,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      decoration: const BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.white,
                                              spreadRadius: 1,
                                              blurRadius: 0.8,
                                              offset: Offset(0, 1),
                                            )
                                          ],
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.12,
                                      width: MediaQuery.of(context).size.width *
                                          0.28,
                                      child: Image.network(
                                        "https://lagbe.xyz/public/uploads/products/thumbnail/DZTgNF7fsuuooywyRjgyrn8BDwRp2TRrLqzeiJsE.jpeg",
                                        fit: BoxFit.fill,
                                      )),
                                );
                              }),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.405,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.405,
                          color: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
