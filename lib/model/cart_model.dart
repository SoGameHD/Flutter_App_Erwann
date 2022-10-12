import 'package:flutter/foundation.dart';

import 'product_model.dart';

class CartModel extends ChangeNotifier{
  final List<Product> lsProducts;

  CartModel(this.lsProducts);
  addProduct(Product product){
    lsProducts.add(product);
    notifyListeners();
  }
  removeProducts(Product product){
    lsProducts.remove(product);
    notifyListeners();
  }
  removeAllProducts(){
    lsProducts.clear();
    notifyListeners();
  }
  getTotalPrice(){
    num totalPrice = 0;
    lsProducts.forEach((element) {totalPrice += element.price;});
    //for(int i = 0; i<lsProducts.length; i++){
    //  totalPrice += lsProducts[i].price;
    //}
    return totalPrice;
  }
}