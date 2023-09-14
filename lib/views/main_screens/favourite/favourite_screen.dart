import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../service/controller/product_provider.dart';
import '../../../service/model/e_mart_product_model.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 14,
            child: ListView.builder(
              itemCount: Provider.of<ProductProvider>(context).loveList.length,
              itemBuilder: (context, i) {
                Product product =
                    Provider.of<ProductProvider>(context).loveList[i];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      height: height * 0.2,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  product.image,
                                  height: height * 0.10,
                                ),
                                Text(
                                  product.name.split(" ")[0],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Price : \$${product.price}",
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Provider.of<ProductProvider>(
                                          context,
                                          listen: false,
                                        ).removeFromFavourite(
                                          product: product,
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
