import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_wagon/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:prueba_wagon/core/theme/theme.dart';
import 'package:prueba_wagon/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:prueba_wagon/features/auth/presentation/pages/login_page.dart';
import 'package:prueba_wagon/features/service/presentation/pages/service_list.dart';
import 'package:prueba_wagon/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AppUserCubit>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthCheck());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba tecnica Wagon',
      theme: AppTheme.darkThemeMode,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, isLogedIn) {
          if (isLogedIn) {
            return const ServicesList();
          }
          return const LoginPage();
        },
      ),
    );
  }
}
