sealed class Result<T> {
  const Result();

  // 성공
  factory Result.success(T data) = Success<T>;

  // 에러
  factory Result.error(Exception error) => Error(error);
}

// 성공 상태
class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

// 에러 상태
class Error<T> extends Result<T> {
  final Exception error;
  const Error(this.error);
}
