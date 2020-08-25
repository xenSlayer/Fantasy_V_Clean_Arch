import 'package:firebase_auth/firebase_auth.dart';

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
// Login Error
const USER_DISABLED = 'ACCOUNT DISABLED';
const INVALID_EMAIL = 'INVALID EMAIL';
const USER_NOT_FOUND = 'USER NOT FOUND';
const WRONG_PASSWORD = 'INCORRECT PASSWORD';

// Signup Error
const EMAIL_ALREADY_IN_USE = 'EMAIL ALREADY IN USE';
const OPERATION_NOT_ALLOWED = 'OPERATION NOT ALLOWED';
const WEAK_PASSWORD = 'WEAK PASSWORD';

String mapFirebaseAuthFailureToMessage(FirebaseAuthException error) {
  switch (error.code) {
    case 'user-disabled':
      return USER_DISABLED;
      break;
    case 'invalid-email':
      return INVALID_EMAIL;
      break;
    case 'user-not-found':
      return USER_NOT_FOUND;
      break;
    case 'wrong-password':
      return WRONG_PASSWORD;
      break;
    case 'email-already-in-use':
      return EMAIL_ALREADY_IN_USE;
      break;
    case 'operation-not-allowed':
      return OPERATION_NOT_ALLOWED;
      break;
    case 'weak-password':
      return WEAK_PASSWORD;
      break;
    default:
      return error.message;
  }
}
