import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sales/model/avis_model.dart';
import 'package:flutter_sales/model/product_model.dart';

class ListAvisPage extends StatelessWidget {
  final Product product;
  ListAvisPage(this.product, {Key? key}) : super(key: key);

  final List<Avis> lsAvis = [
    Avis(1, "Premier Avis", "Jacque", "https://picsum.photos/80/80", 4, "J'adore ce produit, je le recommande"),
    Avis(2, "Deuxième Avis", "Paul", "https://picsum.photos/80/80", 2, "Ce produit ne me plait pas du tout"),
    Avis(3, "Troisième Avis", "Jean", "https://picsum.photos/80/80", 5, "Excellent rien à redire"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Voici tous les avis !"),),
      body: ListView.builder(
          itemCount: lsAvis.length,
          itemBuilder: (context, index){
            final Avis avis = lsAvis[index];
            return InkWell(
              child: ListTile(
                title: Text(avis.title),
                subtitle: Text(avis.username),
                leading: Hero(
                  tag: avis.id,
                  child: Image.network(avis.profile,
                  width: 80, height: 80),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (indexStar) {
                    return Icon(
                      indexStar < avis.note ? Icons.star : Icons.star_border,
                    );
                  }),
                ),
              ),
            );
          }
      )
    );
  }
}
