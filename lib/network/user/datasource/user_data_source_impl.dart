import 'package:injectable/injectable.dart';
import 'package:moyamoya/domain/mapper/user_verify_mapper.dart';
import 'package:moyamoya/domain/model/user_verify.dart';
import 'package:moyamoya/network/core/base_url.dart';
import 'package:moyamoya/network/core/core_network.dart';
import 'package:moyamoya/network/core/get_result.dart';
import 'package:moyamoya/network/core/model/result.dart';
import 'package:moyamoya/network/core/safe_request.dart';
import 'package:moyamoya/network/user/request/user_send_code_request.dart';
import 'package:moyamoya/network/user/request/user_verify_request.dart';
import 'package:moyamoya/network/user/response/user_verify_response.dart';
import 'package:moyamoya/network/user/user_data_source.dart';

@LazySingleton(as: UserDataSource)
class UserDataSourceImpl implements UserDataSource {
  @override
  Future<Result<void>> sendCode(String phone) async {
    return await getResult(() async {
      final response = (await coreDio.post<Map<String, dynamic>>(
        "${BaseUrl.user}/send-code",
        data: UserSendCodeRequest(phone),
      ))
          .safeRequest();
      return;
    });
  }

  @override
  Future<Result<UserVerify>> verifyCode(
    String phone,
    String code,
  ) async {
    return await getResult(
      () async {
        final response = (await coreDio.post<Map<String, dynamic>>(
          "${BaseUrl.user}/verify-code",
          data: UserVerifyRequest(phone, code),
        ))
            .safeRequest();
        return UserVerifyResponse.fromJson(response).toModel();
      },
    );
  }

  @override
  Future<Result<List<String>>> availableProfiles() async {
    return await getResult(() async {
      // final response = (await coreDio
      //         .get<List<String>>("${BaseUrl.user}/available-profiles"))
      //     .safeRequest();

      // return response;
      return [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkYYiJhqTJzJ8T-mTnPw_kBKNZK2iC1hIydw&s",
        "https://www.shutterstock.com/image-vector/set-animal-icons-collection-different-260nw-302778458.jpg",
        "https://cdn-icons-png.flaticon.com/512/616/616408.png",
        "https://cdn.icon-icons.com/icons2/1929/PNG/512/iconfinder-rabbit-4591882_122129.png",
        "https://cdn-icons-png.flaticon.com/512/235/235405.png",
        "https://cdn-icons-png.flaticon.com/512/1752/1752621.png",
        "https://cdn-icons-png.flaticon.com/512/194/194046.png",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkYYiJhqTJzJ8T-mTnPw_kBKNZK2iC1hIydw&s",
        "https://www.shutterstock.com/image-vector/set-animal-icons-collection-different-260nw-302778458.jpg",
        "https://cdn-icons-png.flaticon.com/512/616/616408.png",
        "https://cdn.icon-icons.com/icons2/1929/PNG/512/iconfinder-rabbit-4591882_122129.png",
        "https://cdn-icons-png.flaticon.com/512/235/235405.png",
        "https://cdn-icons-png.flaticon.com/512/1752/1752621.png",
        "https://cdn-icons-png.flaticon.com/512/194/194046.png",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkYYiJhqTJzJ8T-mTnPw_kBKNZK2iC1hIydw&s",
        "https://www.shutterstock.com/image-vector/set-animal-icons-collection-different-260nw-302778458.jpg",
        "https://cdn-icons-png.flaticon.com/512/616/616408.png",
        "https://cdn.icon-icons.com/icons2/1929/PNG/512/iconfinder-rabbit-4591882_122129.png",
        "https://cdn-icons-png.flaticon.com/512/235/235405.png",
        "https://cdn-icons-png.flaticon.com/512/1752/1752621.png",
        "https://cdn-icons-png.flaticon.com/512/194/194046.png",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkYYiJhqTJzJ8T-mTnPw_kBKNZK2iC1hIydw&s",
        "https://www.shutterstock.com/image-vector/set-animal-icons-collection-different-260nw-302778458.jpg",
        "https://cdn-icons-png.flaticon.com/512/616/616408.png",
        "https://cdn.icon-icons.com/icons2/1929/PNG/512/iconfinder-rabbit-4591882_122129.png",
        "https://cdn-icons-png.flaticon.com/512/235/235405.png",
        "https://cdn-icons-png.flaticon.com/512/1752/1752621.png",
        "https://cdn-icons-png.flaticon.com/512/194/194046.png",
      ];
    });
  }
}
