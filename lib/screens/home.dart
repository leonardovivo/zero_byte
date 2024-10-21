import 'package:flutter/material.dart';
import 'package:zero_byte/modules/product_list.dart';
import 'package:zero_byte/widgets/banner.dart';

class ZeroByteHome extends StatelessWidget {
  const ZeroByteHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: const [
            TheBanner(),
            const SizedBox(height: 40),
             ProductList(),
          ],
        ),
      ),
    );
  }
}
