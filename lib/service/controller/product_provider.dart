import 'package:flutter/material.dart';

import '../model/e_mart_product_model.dart';
class ProductProvider extends ChangeNotifier{
  List<Product> allProduct=[];
  List<Product> loveList=[];
  get allProducts {
    int totalCount = 0;
    allProduct.forEach((element) {
      totalCount += element.quantity;
    });
    return totalCount;
  }

  get totalPrice {
    num price = 0;
    for (int i = 0; i < allProduct.length; i++) {
      price += (allProduct[i].price * allProduct[i].quantity);
    }
    return price;
  }

  void countPlus({required Product product}) {
    product.quantity++;
    notifyListeners();
  }

  void countDecrementAndRemove({required Product product}) {
    if (product.quantity > 1) {
      product.quantity--;

      notifyListeners();
    }
  }

  void removeFromProduct({required Product product}) {
    product.quantity = 0;
    print(product.quantity);
    allProduct.remove(product);
    notifyListeners();
  }

  void addToProduct({required Product product}) {
    if (product.quantity >= 1) {
      print(product.quantity);
    } else {
      product.quantity++;
      allProduct.add(product);
      notifyListeners();
    }
  }

  void addToFavourite({required Product product}) {
    product.like = "true";
    loveList.add(product);
    notifyListeners();
  }

  void removeFromFavourite({required Product product}) {
    product.like = "false";
    loveList.remove(product);

    notifyListeners();
  }

}