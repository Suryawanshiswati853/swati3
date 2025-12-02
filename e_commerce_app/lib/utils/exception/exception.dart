import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TFirebaseAuthException implements Exception {
  final String code;
  TFirebaseAuthException(this.code);

 String get message {
  switch (code) {
    // Account creation / sign up
    case 'email-already-in-use':
      return 'The email address is already registered.';
    case 'invalid-email':
      return 'The email address is not valid.';
    case 'operation-not-allowed':
      return 'This sign-in method is not enabled. Please contact support.';
    case 'weak-password':
      return 'The password is too weak. Please use a stronger one.';

    // Sign in
    case 'user-disabled':
      return 'This user account has been disabled.';
    case 'user-not-found':
      return 'No user found with this email address.';
    case 'wrong-password':
      return 'The password is incorrect. Please try again.';

    // Credentials / providers
    case 'account-exists-with-different-credential':
      return 'An account already exists with a different sign-in method.';
    case 'invalid-credential':
      return 'The provided credential is invalid.';
    case 'invalid-verification-code':
      return 'The verification code is invalid.';
    case 'invalid-verification-id':
      return 'The verification ID is invalid.';
    case 'credential-already-in-use':
      return 'This credential is already associated with another account.';

    // Phone auth
    case 'missing-verification-code':
      return 'The SMS verification code is missing.';
    case 'missing-verification-id':
      return 'The verification ID is missing.';
    case 'session-expired':
      return 'The SMS code has expired. Please request a new one.';
    case 'quota-exceeded':
      return 'SMS quota exceeded. Please try again later.';

    // Token / re-auth
    case 'requires-recent-login':
      return 'This operation requires you to log in again.';
    case 'user-mismatch':
      return 'The credential does not match the current user.';
    case 'invalid-user-token':
      return 'The user’s credential is no longer valid. Please log in again.';
    case 'token-expired':
      return 'Your session has expired. Please sign in again.';

    // Multi-factor auth
    case 'second-factor-required':
      return 'Multi-factor authentication is required.';
    case 'missing-phone-number':
      return 'A phone number is required for verification.';

    // Network / server
    case 'network-request-failed':
      return 'Network error. Please check your internet connection.';
    case 'too-many-requests':
      return 'Too many requests. Please wait and try again later.';
    case 'internal-error':
      return 'An internal error has occurred. Please try again.';
    case 'app-not-authorized':
      return 'This app is not authorized to use Firebase Authentication.';
    case 'app-not-installed':
      return 'The app is not installed on this device.';
    case 'captcha-check-failed':
      return 'Captcha verification failed. Please try again.';
    case 'web-context-cancelled':
      return 'The operation was cancelled in the browser.';
    case 'web-storage-unsupported':
      return 'Web storage is not supported or disabled in this browser.';

    // Default
    default:
      return 'An authentication error occurred. [$code]';
  }
}

  // String get message {
  //   switch (code) {
  //     case 'email-already-in-use':
  //       return 'The email address is already registered.';
  //     case 'invalid-email':
  //       return 'The email address is not valid.';
  //     case 'weak-password':
  //       return 'The password is too weak.';
  //     case 'operation-not-allowed':
  //       return 'This operation is not allowed. Please contact support.';
  //     case 'user-disabled':
  //       return 'This user account has been disabled.';
  //     default:
  //       return 'An authentication error occurred. [$code]';
  //   }
  // }
}

class TFirebaseException implements Exception {
  final String code;
  TFirebaseException(this.code);
   String get message {
    switch (code) {
      // Firebase Authentication Errors
      case 'email-already-in-use':
        return 'The email address is already registered.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'operation-not-allowed':
        return 'This sign-in method is not enabled. Please contact support.';
      case 'weak-password':
        return 'The password is too weak. Please use a stronger one.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'user-not-found':
        return 'No user found with this email address.';
      case 'wrong-password':
        return 'The password is incorrect. Please try again.';
      case 'too-many-requests':
        return 'Too many requests. Please wait and try again later.';
      case 'network-request-failed':
        return 'Network error. Please check your internet connection.';
      // Firebase Exceptions
      case 'permission-denied':
        return 'You don’t have permission to perform this action.';
      case 'unavailable':
        return 'Service temporarily unavailable. Try again later.';
      // Platform Exceptions
      case 'channel-error':
        return 'There was an error with the communication channel.';
      case 'bluetooth-not-available':
        return 'Bluetooth is not available on this device.';
      case 'google-play-services-not-available':
        return 'Google Play services are not available.';
      default:
        return 'An unexpected error occurred: [$code]';
    }
  }

  // String get message {
  //   switch (code) {
  //     case 'network-request-failed':
  //       return 'Network error. Please check your internet connection.';
  //     case 'permission-denied':
  //       return 'You don’t have permission to perform this action.';
  //     case 'unavailable':
  //       return 'Service temporarily unavailable. Try again later.';
  //     default:
  //       return 'A Firebase error occurred. [$code]';
  //   }
  // }
}

class TFormatException implements Exception {
  String get message => 'Invalid data format received.';
}

class TPlatformException implements Exception {
  final String code;
  TPlatformException(this.code);

String get message {
    switch (code) {
      // Network / connectivity
      case 'network_error':
        return 'A network error occurred. Please check your connection.';
      case 'timeout':
        return 'The operation timed out. Please try again.';
      case 'no_internet':
        return 'No internet connection is available.';

      // Permissions
      case 'permission_denied':
        return 'Permission denied. Please allow access in settings.';
      case 'location_permission_denied':
        return 'Location permission denied.';
      case 'camera_permission_denied':
        return 'Camera permission denied.';
      case 'microphone_permission_denied':
        return 'Microphone permission denied.';

      // Configuration / environment
      case 'invalid_configuration':
        return 'Invalid app or plugin configuration.';
      case 'service_unavailable':
        return 'The required service is unavailable.';
      case 'plugin_not_installed':
        return 'Required plugin is not installed or initialized.';
      case 'google-play-services-not-available':
        return 'Google Play Services are not available.';
      case 'firebase-not-configured':
        return 'Firebase has not been properly configured on this platform.';

      // Hardware / device
      case 'bluetooth-not-available':
        return 'Bluetooth is not available on this device.';
      case 'gps-not-enabled':
        return 'GPS/location services are not enabled.';
      case 'camera-unavailable':
        return 'Camera is not available on this device.';
      case 'sensor-unavailable':
        return 'Required sensor is not available on this device.';

      // Authentication / platform login
      case 'sign_in_canceled':
        return 'The sign-in process was canceled.';
      case 'sign_in_failed':
        return 'Sign-in failed. Please try again.';
      case 'account_exists':
        return 'An account already exists with this credential.';
      case 'no_account_found':
        return 'No account found on the device.';

      // Storage / file system
      case 'file-not-found':
        return 'The requested file could not be found.';
      case 'read-error':
        return 'An error occurred while reading the file.';
      case 'write-error':
        return 'An error occurred while writing the file.';
      case 'storage-permission-denied':
        return 'Storage permission denied.';

      // Generic / unknown
      case 'unknown':
        return 'An unknown platform error occurred.';
      case 'not-implemented':
        return 'This functionality is not implemented on this platform.';
      case 'channel-error':
        return 'A communication channel error occurred.';
      case 'operation-not-allowed':
        return 'This operation is not allowed on this platform.';
      
      default:
        return 'A platform error occurred. [$code]';
    }
  }
  // String get message {
  //   switch (code) {
  //     case 'network_error':
  //       return 'A network error occurred. Please check your connection.';
  //     case 'invalid_configuration':
  //       return 'Invalid app configuration.';
  //     default:
  //       return 'A platform error occurred. [$code]';
  //   }
  // }
}
