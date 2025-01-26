import 'package:moyamoya/domain/model/user_hair_style.dart';

class UserMyInfo {
  UserMyInfo({
    required this.messageInterval,
    required this.fashionStyle,
    required this.hasGlasses,
    required this.height,
    required this.mbti,
    required this.faceType,
    required this.bodyType,
    required this.hairStyle,
    required this.skinColor,
  });

  final String messageInterval;
  final List<String> fashionStyle;
  final bool hasGlasses;
  final int height;
  final String mbti;
  final String faceType;
  final String bodyType;
  final UserHairStyle hairStyle;
  final String skinColor;
}
