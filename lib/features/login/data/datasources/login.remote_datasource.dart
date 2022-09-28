import 'package:mangamaterial/features/login/data/models/user.model.dart';

abstract class LoginRemoteDataSource {
  UserModel getCurrentUser();

  Future<UserModel> login({
    required String email,
    required String password,
  });

  Future<bool> logout();
}