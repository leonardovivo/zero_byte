import 'package:flutter/material.dart';
import 'package:zero_byte/services/http.dart';

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
            return Column(
            children: List.generate(snapshot.data!.length, (index) {
              var product = snapshot.data![index];
              return ListTile(
                title: Text(product['title']),
                subtitle: Text('\$${product['price']}'),
                leading: Image.network(product['image']),
              );
              },
            )
            );
          } else {
            return const Center(child: Text('Nenhum produto encontrado'));
          }
        },
      );
  }
}
