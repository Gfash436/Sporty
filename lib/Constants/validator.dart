class Validator {
  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) {
      return 'E-mail address is required.';
    }

    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty) {
      return 'Password is required.';
    }

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formPassword)) {
      return '''
      Enter minimum of 8 characters,
      including uppercase letter, number and symbol.
      ''';
    }

    return null;
  }

  String? validateFullName(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) {
      return 'First Name is required.';
    }

    return null;
  }

  String? validateLastName(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) {
      return 'Last Name is required.';
    }

    return null;
  }

  String? validatePhoneNumber(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) {
      return 'Phone Number is required.';
    }

    return null;
  }

  String? validateCode(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) {
      return 'Verification Code is required.';
    }

    return null;
  }
}
