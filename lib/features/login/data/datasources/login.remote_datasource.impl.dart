import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:mangamaterial/features/login/data/datasources/login.remote_datasource.dart';
import 'package:mangamaterial/features/login/data/models/user.model.dart';

@Singleton(as:LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  UserModel getCurrentUser() {
    final User? user = FirebaseAuth.instance.currentUser;
    return UserModel.fromFireBaseUser(firebaseUser: user);
  }

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final UserCredential userCredential =
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel.fromFireBaseUser(firebaseUser: userCredential.user);
  }

  @override
  Future<bool> logout() async {
    await FirebaseAuth.instance.signOut();
    return true;
  }
}