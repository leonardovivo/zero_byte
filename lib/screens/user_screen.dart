import 'package:flutter/material.dart';
import 'package:zero_byte/widgets/banner.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const TheBanner(),
            const SizedBox(height: 40),
            Center(
              child: Container(
                height: 400,
                width: 350,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 38, 38, 38),
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 15.0,
                      color: Colors.blueAccent,
                      offset: Offset(7, 0),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Login',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.white,
                              offset: Offset(2, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
