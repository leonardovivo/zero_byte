import 'package:flutter/material.dart';
import 'package:zero_byte/screens/home.dart';
import 'package:zero_byte/screens/login_screen.dart';
import 'package:zero_byte/screens/register_screen.dart';

void main() {
  runApp(const ZeroByte());
}

class ZeroByte extends StatelessWidget {
  const ZeroByte({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zero Byte',
      theme: ThemeData.dark().copyWith(),
      home: const ZeroByteHome(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
