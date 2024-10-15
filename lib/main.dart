import 'package:flutter/material.dart';
import 'package:zero_byte/screens/home.dart';

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
    );
  }
}
