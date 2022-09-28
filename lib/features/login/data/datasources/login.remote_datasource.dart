import 'package:mangamaterial/features/login/data/models/user.model.dart';

abstract class LoginRemoteDataSource {
  /// Get current user from firebase auth
  UserModel getCurrentAppUser();

  /// Login user to firebase auth (email/pwd)
  Future<UserModel> loginAppUser({
    required String email,
    required String password,
  });

  /// Logout user from firebase auth
  Future<void> logoutAppUser();
}