import 'package:tedikap_admin/app/data/model/auth/user_model.dart';

class AuthResponse {
  UserModel user;
  String token;

  AuthResponse({required this.user, required this.token});
}
