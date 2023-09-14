import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../service/controller/product_provider.dart';
import '../../../service/db_helper/db_helper.dart';
import '../../../service/model/e_mart_product_model.dart';
class CartItemScreen extends StatefulWidget {
  const CartItemScreen({super.key});

  @override
  State<CartItemScreen> createState() => _CartItemScreenState();
}

class _CartItemScreenState extends State<CartItemScreen> with TickerProviderStateMixin{
  late Future<List<Product>> getAllData;

  late TabController tabController2;

  int initialTabIndex2 = 0;
  TextEditingController barController = TextEditingController();

  @override
  void initState() {
    super.initState();
    tabController2 = TabController(
      length: 5,
      vsync: this,
      initialIndex: 0,
    );
    getAllData = DBHelper.dbHelper.fetchSearchedRecord(
      data: "SmartPhone",
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    barController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 15,
              ),
              child: Text(
                "Hii Khalil",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                bottom: 10,
              ),
              child: Text(
                "Find your Product",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: TextFormField(
                controller: barController,
                onChanged: (val) {
                  setState(
                        () {
                      DBHelper.dbHelper.fetchSearchedRecord(
                        data: val,
                      );
                    },
                  );
                },
                decoration: InputDecoration(
                  fillColor: Colors.black12,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  suffixIcon: const Icon(
                    Icons.segment,
                    color: Colors.black,
                  ),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            TabBar(
              physics: const BouncingScrollPhysics(),
              isScrollable: true,
              controller: tabController2,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              indicatorColor: Colors.transparent,
              onTap: (value) {
                setState(() {
                  initialTabIndex2 = value;
                  if (initialTabIndex2 == 0) {
                    getAllData = DBHelper.dbHelper
                        .fetchSearchedRecord(data: "SmartPhones");
                  }
                  if (initialTabIndex2 == 1) {
                    getAllData =
                        DBHelper.dbHelper.fetchSearchedRecord(data: "Laptops");
                  }
                  if (initialTabIndex2 == 2) {
                    getAllData =
                        DBHelper.dbHelper.fetchSearchedRecord(data: "SmartWatches");
                  }
                  if (initialTabIndex2 == 3) {
                    getAllData =
                        DBHelper.dbHelper.fetchSearchedRecord(data: "HeadPhones");
                  }
                  if (initialTabIndex2 == 4) {
                    getAllData =
                        DBHelper.dbHelper.fetchSearchedRecord(data: "Ipad");
                  }
                });
              },
              tabs: const [
                Tab(
                  text: " SmartPhones ",
                ),
                Tab(
                  text: " Laptops ",
                ),
                Tab(
                  text: " SmartWatches ",
                ),
                Tab(
                  text: " HeadPhones ",
                ),
                Tab(
                  text: " IPads ",
                )
              ],
            ),
            FutureBuilder(
              future: getAllData,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error : ${snapshot.hasError}",
                    ),
                  );
                } else if (snapshot.hasData) {
                  List<Product>? data = snapshot.data;
                  return SizedBox(
                    height: height * 0.56,
                    child: GridView.builder(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: <Widget>[
                            Card(
                              elevation: 4,
                              child: SizedBox(
                                height: height * 0.35,
                                width: width * 0.52,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: height * 0.017,
                                    ),
                                    Center(
                                      child: Image.asset(
                                        data[index].image,
                                        height: height * 0.13,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.017,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                      ),
                                      child: Text(
                                        data[index].name,
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: height * 0.27,
                              width: width * 0.52,
                              alignment: Alignment.bottomRight,
                              margin: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (data[index].like == "false") {
                                          Provider.of<ProductProvider>(context,
                                              listen: false)
                                              .addToFavourite(
                                              product: data[index]);
                                        } else {
                                          Provider.of<ProductProvider>(context,
                                              listen: false)
                                              .removeFromFavourite(
                                              product: data[index]);
                                        }
                                      });
                                    },
                                    icon: (data[index].like == "true")
                                        ? const Icon(
                                      CupertinoIcons.heart_fill,
                                      color: Colors.red,
                                      size: 25,
                                    )
                                        : const Icon(
                                      CupertinoIcons.heart,
                                      size: 25,
                                      color: Colors.red,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (data[index].quantity == 0) {
                                          Provider.of<ProductProvider>(context,
                                              listen: false)
                                              .addToProduct(
                                              product: data[index]);
                                        } else {
                                          Provider.of<ProductProvider>(context,
                                              listen: false)
                                              .removeFromProduct(
                                              product: data[index]);
                                        }
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: (data[index].quantity == 0)
                                            ? const Color(0xff000000)
                                            .withOpacity(0.9)
                                            : Colors.red,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(5)
                                        ),
                                      ),
                                      child: (data[index].quantity == 0)
                                          ? const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      )
                                          : const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
