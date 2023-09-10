import 'package:ecotutorial/apppstyle.dart';
import 'package:ecotutorial/models/product.dart';
import 'package:ecotutorial/services/api_handler.dart';
import 'package:ecotutorial/widget/productlist_view.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  List<Products> productList = [];
  APIHandler apiHandler = APIHandler();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getData();
  }

  Future<void> getData() async {
    productList = await apiHandler.getAllProducts();
    setState(() {});
  }

  // Future<void> getAllProductsByName(String name) async {
  //   productList = await apiHandler.getAllProductsByName(name: name);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 5, 0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  "assets/images/img1.jpg",
                ),
                fit: BoxFit.fill,
              )),
              child: Container(
                padding: const EdgeInsets.only(left: 8, bottom: 15),
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
                      padding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Colors.white,
                      labelStyle: appStyle(24, Colors.white, FontWeight.bold),
                      unselectedLabelColor: Colors.grey.withOpacity(0.3),
                      tabs: const [
                        Tab(
                          text: "Clothes",
                        ),
                        Tab(
                          text: "Electric",
                        ),
                        Tab(
                          text: "Others",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.21),
              child: TabBarView(controller: _tabController, children: [
                // Container(
                //   decoration: const BoxDecoration(
                //     color: Color.fromARGB(255, 250, 250, 250),
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(20),
                //       topRight: Radius.circular(20),
                //     ),
                //   ),
                //   child: GridView.builder(
                //       gridDelegate:
                //           const SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 2, childAspectRatio: 0.64,
                //         mainAxisSpacing: 10,
                //         crossAxisSpacing: 5,

                //         // childAspectRatio: 2,
                //       ),
                //       itemCount: productList.length,
                //       scrollDirection: Axis.vertical,
                //       itemBuilder: (context, index) {
                //         final Products prodcut = productList[index];
                //         return ChangeNotifierProvider<Products>.value(
                //             value: prodcut,
                //             child: ProductCard(
                //               price: prodcut.price.toString(),
                //               category: prodcut.category!.name.toString(),
                //               id: prodcut.id.toString(),
                //               name: prodcut.title.toString(),
                //               image: prodcut.images![0],
                //             ));
                //       }),
                // ),
                HomePageProduct(
                  productList: productList,
                ),
                HomePageProduct(
                  productList: productList,
                ),
                HomePageProduct(
                  productList: productList,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
