import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_byte/modules/product.dart';
import 'package:zero_byte/widgets/banner.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const TheBanner(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back,
                      size: 30, color: Colors.blue),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Expanded(
              child: cart.isCartEmpty
                  ? const Center(
                      child: Text(
                        'O carrinho está vazio',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: cart.products.length,
                            itemBuilder: (context, index) {
                              Product product = cart.products[index];
                              return ListTile(
                                leading: const Icon(Icons.shopping_cart),
                                title: Text(product.name),
                                subtitle: Text(
                                    'R\$ ${product.price.toStringAsFixed(2)}'),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    cart.removeProduct(product);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(
                                'Total: R\$ ${cart.totalPrice.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: cart.isCartEmpty
                                    ? null
                                    : () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: const Text(
                                                'Compra finalizada!'),
                                            content: const Text(
                                                'Obrigado por comprar na Zero Byte!'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  cart.clearCart();
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                child: const Text('Finalizar Compra'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
