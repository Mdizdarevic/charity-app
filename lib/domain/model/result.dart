sealed class Result<T> {
  const Result();

  factory Result.ok(value) => Ok(value);

  factory Result.error(error) => Error(error);
}

class Ok<T> extends Result<T> {
  final T value;

  Ok(this.value);
}

class Error<T> extends Result<T> {
  final Exception error;

  Error(this.error);
}