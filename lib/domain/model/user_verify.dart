import 'package:moyamoya/domain/model/user_token.dart';

class UserVerify {
  const UserVerify(this.isNewUser, this.token);
  final bool isNewUser;
  final UserToken? token;
}
