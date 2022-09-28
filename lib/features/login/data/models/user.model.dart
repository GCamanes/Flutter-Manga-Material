import 'package:firebase_auth/firebase_auth.dart';
import 'package:mangamaterial/features/login/domain/entities/user.entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String displayName,
    required String email,
    required bool emailVerified,
    required bool success,
  }) : super(
    displayName: displayName,
    email: email,
    emailVerified: emailVerified,
    success: success,
  );

  factory UserModel.fromFireBaseUser({User? firebaseUser}) {
    return UserModel(
      displayName: firebaseUser?.displayName ?? '',
      email: firebaseUser?.email ?? '',
      emailVerified: firebaseUser?.emailVerified ?? false,
      success: firebaseUser != null,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'displayName': displayName,
      'email': email,
      'emailVerified': emailVerified,
      'success': success,
    };
  }
}