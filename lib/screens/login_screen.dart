import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onSuccess;

  const LoginScreen({super.key, required this.onSuccess});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final String _correctPassword = "estiba";

  void _checkPassword() {
    if (_passwordController.text == _correctPassword) {
      widget.onSuccess();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Contraseña incorrecta", textAlign: TextAlign.center),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Ingrese la contraseña",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: "Contraseña",
                  labelStyle: TextStyle(color: Colors.white),
                ),
                onSubmitted: (_) => _checkPassword(),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: _checkPassword,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  fixedSize: const Size(150, 45),
                ),
                child: const Text("Entrar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
