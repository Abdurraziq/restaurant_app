abstract class ApiState<T> {}

class OnLoading<T> extends ApiState<T> {}

class OnDataLoaded<T> extends ApiState<T> {
  final T data;
  OnDataLoaded(this.data);
}

class OnFailure<T> extends ApiState<T> {
  final String message;
  OnFailure(this.message);
}
