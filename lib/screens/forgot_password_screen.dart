import 'package:flutter/material.dart';
import 'package:zero_byte/screens/login_screen.dart';
import 'package:zero_byte/widgets/banner.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  String? _confirmationMessage;
  String? _errorMessage;

  void _sendRecoveryEmail() {
    final email = _emailController.text;

    if (email.isEmpty) {
      setState(() {
        _errorMessage = 'É preciso preencher o campo de E-mail';
        _confirmationMessage = null;
      });
      return;
    }

    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(email)) {
      setState(() {
        _errorMessage = 'Insira um E-mail válido';
        _confirmationMessage = null;
      });
      return;
    }

    setState(() {
      _confirmationMessage = 'E-mail de recuperação enviado para $email';
      _errorMessage = null;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
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
                          const begin = Offset(-1.0, 0.0);
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
                ),
              ),
            ),
            const SizedBox(height: 60),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  height: 360,
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
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          'Recuperação de Senha',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontSize: 25,
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
                      const SizedBox(height: 20),
                      if (_confirmationMessage != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            _confirmationMessage!,
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      if (_errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            _errorMessage!,
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      const SizedBox(height: 50),
                      const Text(
                        'E-mail',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(40.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                labelText: 'Insira seu E-mail...',
                                fillColor: Color.fromARGB(255, 77, 76, 76),
                                filled: true,
                                labelStyle: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      ElevatedButton(
                        onPressed: _sendRecoveryEmail,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 0, 170, 255),
                        ),
                        child: const Text(
                          'Enviar E-mail',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
