
// ignore_for_file: prefer_const_constructors

import 'failure_response.dart';

class ResponseState<T> {
  final bool isLoading;
  final T? data;
  final FailureResponse? error;

  const ResponseState({
    this.isLoading = false,
    this.data,
    this.error,
  });

  // Factory for the default state.
  factory ResponseState.def() {
    ResponseState(data: null);
    ResponseState(error: null);
    return ResponseState(isLoading: false);
  }

  // Factory for the loading state.
  factory ResponseState.loading() {
    ResponseState(data: null);
    ResponseState(error: null);
    return ResponseState(isLoading: true);
  }

  // Factory for the success state.
  factory ResponseState.success(T data) {
    ResponseState(isLoading: false);
    ResponseState(error: null);
    return ResponseState(data: data);
  }

  // Factory for the failed state.
  factory ResponseState.failed(FailureResponse error) {
    ResponseState(isLoading: false);
    ResponseState(data: null);
    return ResponseState(error: error);
  }
}