import 'package:moyamoya/domain/model/user_profile_available_personality.dart';
import 'package:moyamoya/network/user/response/user_profile_available_personality_response.dart';

extension UserProfileAvailablePersonalityMapper
    on UserProfileAvailablePersonalityResponse {
  UserProfileAvailablePersonality toModel() {
    return UserProfileAvailablePersonality(
      id: id,
      content: content,
    );
  }
}
