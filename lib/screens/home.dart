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
            SizedBox(height: 40),
            Center(
              child: Text(
                'Nossos Produtos',
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            ProductList(),
          ],
        ),
      ),
    );
  }
}
