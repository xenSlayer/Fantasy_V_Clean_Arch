import 'failures.dart';

const SERVER_FAILURE_MESSAGE = 'Server Error';
const UNKNOWN_ERROR = 'Something went wrong';

String mapErrorToMessage(Failure error) {
  switch (error.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
      break;
    default:
      return UNKNOWN_ERROR;
  }
}
