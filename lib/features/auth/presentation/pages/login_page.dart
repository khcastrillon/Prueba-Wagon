import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_wagon/core/common/widgets/loader.dart';
import 'package:prueba_wagon/core/utils/show_snackbar.dart';
import 'package:prueba_wagon/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:prueba_wagon/features/auth/presentation/widgets/auth_field.dart';

class LoginPage extends StatefulWidget {
  static route() {
    return MaterialPageRoute(builder: (context) => const LoginPage());
  }

  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: Loader(),
              );
            }
            return Form(
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
                    hintText: 'email',
                    textController: emailController,
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
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                      }
                    },
                    child: const Text('Ingresar'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
