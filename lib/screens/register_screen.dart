import 'package:flutter/material.dart';
import 'package:zero_byte/widgets/banner.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String registerMessage = '';
  final String validUser = "user";
  final String validEmail = 'teste@teste.com';
  final String validPassword = '123456';

  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _register() {
    String user = userController.text;
    String email = emailController.text;
    String password = passwordController.text;

    if (user.isEmpty || email.isEmpty || password.isEmpty) {
      setState(() {
        registerMessage = 'Todos os campos devem ser preenchidos!';
      });
    } else if (user == validUser &&
        email == validEmail &&
        password == validPassword) {
      setState(() {
        registerMessage = 'Cadastro bem sucedido!';
      });
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context, '/home');
      });
    } else {
      setState(() {
        registerMessage = 'Dados inválidos! Tente novamente.';
      });
    }
  }

  @override
  void dispose() {
    userController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TheBanner(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back,
                        size: 30, color: Colors.white),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Container(
                    height: 700,
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
                            'Cadastro',
                            style: TextStyle(
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
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            registerMessage,
                            style: TextStyle(
                              color: registerMessage == 'Cadastro bem sucedido!'
                                  ? Colors.green
                                  : (registerMessage.isEmpty
                                      ? Colors.red
                                      : Colors.red),
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Usuário',
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
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
                                controller: userController,
                                decoration: const InputDecoration(
                                  labelText: 'Insira seu nome de Usuário...',
                                  fillColor: Color.fromARGB(255, 77, 76, 76),
                                  filled: true,
                                  labelStyle: TextStyle(color: Colors.white70),
                                ),
                              ),
                            ),
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
                          padding: const EdgeInsets.only(left: 20, right: 20),
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
                                controller: emailController,
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
                        const SizedBox(height: 50),
                        const Text(
                          'Senha',
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
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
                                controller: passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: 'Insira sua Senha...',
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
                          onPressed: _register,
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all<Color>(
                              const Color.fromARGB(255, 0, 170, 255),
                            ),
                          ),
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Já tem uma conta?",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              },
                              child: const Text(
                                "LOGUE",
                                style: TextStyle(
                                  color: Colors.greenAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
