import 'package:moyamoya/domain/model/user_hair_style.dart';

class UserIdealType {
  UserIdealType({
    required this.messageInterval,
    required this.fashionStyle,
    required this.hasGlasses,
    required this.heightLevel,
    required this.ageType,
    required this.personality,
    required this.faceType,
    required this.bodyType,
    required this.hairStyle,
    required this.skinColor,
  });

  final String messageInterval;
  final List<String> fashionStyle;
  final bool hasGlasses;
  final String heightLevel;
  final String ageType;
  final List<String> personality;
  final String faceType;
  final String bodyType;
  final UserHairStyle hairStyle;
  final String skinColor;
}
