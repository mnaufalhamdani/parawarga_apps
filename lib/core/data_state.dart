
import 'failure_response.dart';

enum ResponseStatus {
  loading, def, success, failed
}

abstract class ResponseState {
  final dynamic data;
  final FailureResponse? error;

  const ResponseState({this.data, this.error});
}

class ResponseDefault extends ResponseState {
  const ResponseDefault() : super(data: null, error: null);
}

class ResponseLoading extends ResponseState {
  const ResponseLoading() : super(data: null, error: null);
}

class ResponseSuccess extends ResponseState {
  const ResponseSuccess(dynamic data) : super(data: data);
}

class ResponseFailed extends ResponseState {
  const ResponseFailed(FailureResponse error) : super(error: error);
}
