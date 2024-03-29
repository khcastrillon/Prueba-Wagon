import 'package:get_it/get_it.dart';
import 'package:prueba_wagon/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:prueba_wagon/core/secrets/app_secrets.dart';
import 'package:prueba_wagon/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:prueba_wagon/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:prueba_wagon/features/auth/domain/repositories/auth_repository.dart';
import 'package:prueba_wagon/features/auth/domain/usecases/current_user.dart';
import 'package:prueba_wagon/features/auth/domain/usecases/user_login.dart';
import 'package:prueba_wagon/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:prueba_wagon/features/service/data/datasources/service_data_source.dart';
import 'package:prueba_wagon/features/service/data/repositories/service_repository_impl.dart';
import 'package:prueba_wagon/features/service/domain/repositories/service_repository.dart';
import 'package:prueba_wagon/features/service/domain/usecases/create_service.dart';
import 'package:prueba_wagon/features/service/presentation/bloc/service_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initService();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnnonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);

  // Core
  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  // Datasourse
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    // Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UserLogin(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => CurrentUser(
        serviceLocator(),
      ),
    )
    //Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        userLogin: serviceLocator(),
        currentUser: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}

void _initService() {
  // Datasourse
  serviceLocator
    ..registerFactory<ServiceRemoteDataSource>(
      () => ServiceRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    // Repository
    ..registerFactory<ServiceRepository>(
      () => ServiceRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => CreateService(
        serviceLocator(),
      ),
    )
    //Bloc
    ..registerLazySingleton(
      () => ServiceBloc(
        serviceLocator(),
      ),
    );
}
