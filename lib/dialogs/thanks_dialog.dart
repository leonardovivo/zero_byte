import 'package:flutter/material.dart';

class ThanksDialog extends StatelessWidget {
  const ThanksDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          'Compra finalizada!',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: const Text(
        'Faça cada Byte valer a pena!',
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Poppins",
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'OK',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
