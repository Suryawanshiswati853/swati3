
class Validation {
  /// Validates email field
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }

    return null;
  }

  /// Validates password (for login)
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  /// Validates new password (for registration or reset)
  static String? validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'New password is required';
    }

   
    // final hasUppercase = RegExp(r'[A-Z]').hasMatch(value);
    // final hasLowercase = RegExp(r'[a-z]').hasMatch(value);
    // final hasDigit = RegExp(r'\d').hasMatch(value);
    // final hasSpecialChar = RegExp(r'[!@#\$&*~]').hasMatch(value);

    // if (!hasUppercase) {
    //   return 'Password must include at least one uppercase letter';
    // }
    // if (!hasLowercase) {
    //   return 'Password must include at least one lowercase letter';
    // }
    // if (!hasDigit) {
    //   return 'Password must include at least one digit';
    // }
    // if (!hasSpecialChar) {
    //   return 'Password must include at least one special character (!@#\$&*~)';
    // }

    return null;
  }

  /// Validates confirm password
  static String? validateConfirmPassword(String? value, String? newPassword) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != newPassword) {
      return 'Passwords do not match';
    }
    return null;
  }
  static String? validateOtp(String? value, {int length = 6}) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    }
    if (value.length != length) {
      return 'OTP must be $length digits';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'OTP must contain only numbers';
    }
    return null;
  }
   static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }

    // Optional: Only allow letters and spaces
    final nameRegex = RegExp(r"^[a-zA-Z\s]+$");
    if (!nameRegex.hasMatch(value.trim())) {
      return 'Enter a valid name (letters and spaces only)';
    }

    if (value.trim().length < 2) {
      return 'Name is too short';
    }

    return null;
  }
   static String? validateMobile(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Mobile number is required';
    }

    final mobileRegex = RegExp(r'^[0-9]{10}$');
    if (!mobileRegex.hasMatch(value.trim())) {
      return 'Enter a valid 10-digit mobile number';
    }

    return null;
  }

  /// Validates pincode field
  static String? validatePincode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Pincode is required';
    }

    final pincodeRegex = RegExp(r'^\d{5,6}$'); // Accepts 5 or 6 digit pincodes
    if (!pincodeRegex.hasMatch(value.trim())) {
      return 'Enter a valid pincode';
    }

    return null;
  }

  /// Validates address field (from Google Maps)
  static String? validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Address is required';
    }

    if (value.trim().length < 5) {
      return 'Address looks too short';
    }

    return null;
  }
   static String? validateDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Joining date is required";
    }

    // Check format (YYYY-MM-DD)
    final regex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!regex.hasMatch(value)) {
      return "Date must be in YYYY-MM-DD format";
    }

    try {
      final pickedDate = DateTime.parse(value);
      if (pickedDate.isAfter(DateTime.now())) {
        return "Joining date cannot be in the future";
      }
    } catch (e) {
      return "Invalid date selected";
    }

    return null; // no errors
  }
}


