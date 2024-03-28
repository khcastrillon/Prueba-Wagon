import 'package:flutter/material.dart';
import 'package:prueba_wagon/features/auth/presentation/widgets/auth_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Iniciar sesion',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              AuthField(
                hintText: 'Nombre',
                textController: nameController,
              ),
              const SizedBox(
                height: 20,
              ),
              AuthField(
                hintText: 'Contraseña',
                textController: passwordController,
                isPassword: true,
              ),
              const SizedBox(
                height: 20,
              ),
              // MainButton(text: 'Iniciar sesion'),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Iniciar sesion'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
