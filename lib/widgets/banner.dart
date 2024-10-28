import 'package:flutter/material.dart';
import 'package:zero_byte/screens/cart_screen.dart';
import 'package:zero_byte/screens/home.dart';
import 'package:zero_byte/screens/login_screen.dart';

class TheBanner extends StatelessWidget {
  const TheBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 450,
          height: 285,
          child: Image.asset(
            "assets/images/banner.jpg",
            fit: BoxFit.cover,
          ),
        ),
        const Positioned(
          top: 110,
          left: 86,
          child: Text(
            "Zero Byte",
            style: TextStyle(
              color: Color(0xFF00FFFF),
              fontFamily: "voltec",
              fontSize: 60,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.blueAccent,
                  offset: Offset(7, 0),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          top: 200,
          left: 24,
          child: Text(
            "Onde o Zero vira inovação e o Byte, solução!",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: IconButton(
            icon: Image.asset(
              "assets/images/logo.png",
              height: 90,
              width: 90,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ZeroByteHome(),
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 25,
          right: 10,
          child: IconButton(
            iconSize: 30,
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                  ) =>
                      const CartScreen(),
                  transitionsBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ) {
                    const begin = Offset(0.0, -1.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    final tween = Tween(begin: begin, end: end).chain(
                      CurveTween(curve: curve),
                    );
                    final offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ),
        Positioned(
          top: 25,
          right: 50,
          child: IconButton(
            iconSize: 30,
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                  ) =>
                      const LoginScreen(),
                  transitionsBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;

                    final tween = Tween(begin: begin, end: end).chain(
                      CurveTween(curve: curve),
                    );
                    final offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
            icon: const Icon(Icons.person),
          ),
        )
      ],
    );
  }
}
