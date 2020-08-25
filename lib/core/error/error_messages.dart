import 'failures.dart';

// Network Errors with messages
const SERVER_FAILURE_MESSAGE = 'Server Error';
const UNKNOWN_NETWORK_ERROR = 'Something went wrong';

String mapNetworkErrorToMessage(Failure error) {
  switch (error.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
      break;
    default:
      return UNKNOWN_NETWORK_ERROR;
  }
}

// FirebaseAuth error with error messages
const ERROR_OPERATION_NOT_ALLOWED = 'OPERATION NOT ALLOWED';
const ERROR_WEAK_PASSWORD = 'WEAK PASSWORD';
const ERROR_INVALID_EMAIL = 'INVALID EMAIL';
const ERROR_INVALID_CREDENTIAL = 'INVALID CREDENTIAL';
const ERROR_EMAIL_ALREADY_IN_USE = 'EMAIL ALREADY IN USE';
const UNKNOWN_ERROR = 'TRY AGAIN';

String mapFirebaseAuthFailureToMessage(error) {
  switch (error.code) {
    case 'ERROR_OPERATION_NOT_ALLOWED':
      return ERROR_OPERATION_NOT_ALLOWED;
      break;
    case 'ERROR_INVALID_EMAIL':
      return ERROR_INVALID_EMAIL;
      break;
    case 'ERROR_EMAIL_ALREADY_IN_USE':
      return ERROR_EMAIL_ALREADY_IN_USE;
      break;
    case 'ERROR_INVALID_CREDENTIAL':
      return ERROR_INVALID_CREDENTIAL;
      break;
    default:
      return UNKNOWN_ERROR;
  }
}
