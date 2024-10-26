import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_byte/dialogs/confirmation_dialog.dart';
import 'package:zero_byte/dialogs/thanks_dialog.dart';
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
                      size: 30, color: Colors.white),
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
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                leading: const Icon(
                                  Icons.shopping_cart,
                                  color: Colors.blue,
                                ),
                                title: Text(
                                  product.name,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                                subtitle: Text(
                                  'R\$ ${product.price.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    color: Colors.greenAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.remove,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        cart.removeProduct(product);
                                      },
                                    ),
                                    Text(
                                      '${product.quantity}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.greenAccent,
                                      ),
                                      onPressed: () {
                                        cart.addProduct(product);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        cart.removeProduct(product);
                                      },
                                    ),
                                  ],
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
                                  color: Colors.greenAccent,
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
                                          builder: (context) =>
                                              ConfirmationDialog(
                                            onConfirm: () {
                                              cart.clearCart();

                                              Navigator.of(context).pop();

                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    const ThanksDialog(),
                                              );
                                            },
                                            onCancel: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        );
                                      },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor:
                                      const Color.fromARGB(255, 0, 138, 250),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  shadowColor:
                                      const Color.fromARGB(255, 248, 251, 255),
                                  elevation: 5,
                                  textStyle: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                child: const Text(
                                  'Finalizar Compra',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
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
