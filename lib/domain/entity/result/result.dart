sealed class Result<T> {
  const Result();

  const factory Result.success(T value) = Success;
  const factory Result.failed(String errorMessage) = Failed;

  bool get isSuccess => this is Success;
  bool get isFailed => this is Failed;

  T? get resultValue => isSuccess ? (this as Success).value : null;
  String? get errorMessage => isFailed ? (this as Failed).errorMessage : null;
}

class Success<T> extends Result<T> {
  final T value;

  const Success(this.value);
}

class Failed<T> extends Result<T> {
  final String errorMessage;

  const Failed(this.errorMessage);
}
