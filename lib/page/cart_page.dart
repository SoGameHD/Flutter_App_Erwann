import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sales/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Panier Flutter Sales"),),
      body: Column(
        children: [
              Text("Le montant total de votre panier est de ${context.read<CartModel>().getTotalPrice()}"),
              Text("Votre panier contient ${context.watch<CartModel>().lsProducts.length} éléments "),
              Text("Votre panier total est de :"),
              TextButton(
                onPressed: ()=> context.read<CartModel>().removeAllProducts(),
                child: Text("Vider le panier"),
              ),
              Consumer<CartModel>(
                  builder: (_,cart,__) => Expanded(
                    child: ListView.builder(
                        itemCount: cart.lsProducts.length,
                        itemBuilder: (_,index) =>
                            ListTile(
                              title: Text(cart.lsProducts[index].title),
                              leading: Hero(
                                tag: cart.lsProducts[index].id,
                                child: Image.network(cart.lsProducts[index].image,
                                    width: 80, height: 80),
                              ),
                              trailing: TextButton(
                                onPressed: ()=> context.read<CartModel>().removeProducts(cart.lsProducts[index]),
                                child: Icon(Icons.remove_shopping_cart),
                            ),
                         )
                      ),
                  )
              )
            ],

      ),
    );
  }
}
