import 'package:flutter/material.dart';
import 'package:zero_byte/services/http.dart';
import 'package:zero_byte/widgets/product_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late Future<List<dynamic>> _products;

  @override
  void initState() {
    super.initState();
    _products = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _products,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 40,
              childAspectRatio: 0.5,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var product = snapshot.data![index];
              return ProductCard(
                title: product['title'],
                price: product['price'].toDouble(),
                imageUrl: product['image'],
              );
            },
          );
        } else {
          return const Center(child: Text('Nenhum produto encontrado'));
        }
      },
    );
  }
}
