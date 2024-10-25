class CustomValidators {
  static String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter the phonenumber';
    } else if (value.length < 10) {
      return 'phone number must be 10 characters';
    }
    return null;
  }

  static String? validateCompanyCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter the valid company code';
    }
    return null;
  }

  static String? validateHrmsId(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter the valid HRMS ID';
    }
    return null;
  }
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter the valid password';
    }
    return null;
  }
}
