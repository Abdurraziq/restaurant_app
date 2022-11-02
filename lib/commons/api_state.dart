import 'package:equatable/equatable.dart';

abstract class ApiState<T> extends Equatable {}

class OnLoading<T> extends ApiState<T> {
  @override
  List<Object?> get props => [];
}

class OnDataLoaded<T> extends ApiState<T> {
  final T data;
  OnDataLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class OnFailure<T> extends ApiState<T> {
  final String message;
  OnFailure(this.message);

  @override
  List<Object?> get props => [message];
}
