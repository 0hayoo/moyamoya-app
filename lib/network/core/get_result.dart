import 'package:moyamoya/network/core/model/result.dart';

Future<Result<T>> getResult<T>(
  Future<T> Function() block,
) async {
  try {
    return Result.success(await block());
  } on Exception catch (exception) {
    return Result.error(exception);
  }
}
