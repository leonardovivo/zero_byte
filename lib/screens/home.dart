import 'package:flutter/material.dart';
import 'package:zero_byte/widgets/banner.dart';

class ZeroByteHome extends StatelessWidget {
  const ZeroByteHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TheBanner(),
          ],
        ),
      ),
    );
  }
}
