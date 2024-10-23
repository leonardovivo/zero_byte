import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_byte/providers/cart_provider.dart';
import 'package:zero_byte/screens/home.dart';
import 'package:zero_byte/screens/login_screen.dart';
import 'package:zero_byte/screens/register_screen.dart';
import 'package:zero_byte/screens/cart_screen.dart';

void main() {
  runApp(const ZeroByte());
}

class ZeroByte extends StatelessWidget {
  const ZeroByte({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Zero Byte',
        theme: ThemeData.dark().copyWith(),
        home: const ZeroByteHome(),
        routes: {
          '/home': (context) => const ZeroByteHome(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/cart': (context) => const CartScreen(),
        },
      ),
    );
  }
}
