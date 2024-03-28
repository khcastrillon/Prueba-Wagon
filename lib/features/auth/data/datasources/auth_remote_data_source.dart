import 'package:prueba_wagon/core/error/exceptions.dart';
import 'package:prueba_wagon/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currenUserSession;
  Future<UserModel> loginWithEmailPass({
    required String email,
    required String password,
  });
  Future<UserModel?> getCurrenUserData();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Session? get currenUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel> loginWithEmailPass({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (response.user == null) {
        throw const ServerException('User is null!');
      }
      return UserModel.fromJson(response.user!.toJson())
          .copyWith(email: currenUserSession!.user.email);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel?> getCurrenUserData() async {
    try {
      if (currenUserSession != null) {
        final userData = await supabaseClient.from('profiles').select().eq(
              'id',
              currenUserSession!.user.id,
            );
        return UserModel.fromJson(userData.first)
            .copyWith(email: currenUserSession!.user.email);
      }
      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
