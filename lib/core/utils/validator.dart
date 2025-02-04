import 'package:banking_app2/features/CreditCards/data/credit_cards_types.dart';
import 'package:intl/intl.dart';

class Validator {
  // Validate email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // Validate password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  // Validate phone number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegex = RegExp(r'^[0-9]{10,}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  // Validate salary
  static String? validateSalary(String? value) {
    if (value == null || value.isEmpty) {
      return 'Salary is required';
    }
    final salaryRegex = RegExp(r'^\d*\.?\d+$');
    if (!salaryRegex.hasMatch(value)) {
      return 'Enter a valid salary';
    }
    return null;
  }

  // Validate name
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Enter a valid name';
    }
    return null;
  }

  // Validate birth date
  static String? validateBirthDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Birth date is required';
    }
    final dateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!dateRegex.hasMatch(value)) {
      return 'Enter a valid birth date (YYYY-MM-DD)';
    }

    // Check if the entered date is the same as the current date
    final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    if (value == currentDate) {
      return 'Birth date cannot be today';
    }

    return null;
  }

  // Validate city
  static String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'City is required';
    }
    return null;
  }

  // Validate gender
  static String? validateGender(bool? isGenderValid) {
    if (isGenderValid == null || !isGenderValid) {
      return 'Gender is required';
    }
    return null;
  }

  // Validate card holder name
  static String? validateCardHolderName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Card holder name is required';
    }
    final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Enter a valid card holder name';
    }
    return null;
  }

  // Validate card number
  static String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty || value.length != 16) {
      return 'Card number is required';
    }
    final cardNumberRegex = RegExp(r'^\d{16}$');
    if (!cardNumberRegex.hasMatch(value)) {
      return 'Enter a valid 16-digit card number';
    }
    return null;
  }

  // Validate expiry date
  static String? validateExpiryDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Expiry date is required';
    }
    final expiryDateRegex = RegExp(r'^(0[1-9]|1[0-2])\/?([0-9]{2})$');
    if (!expiryDateRegex.hasMatch(value)) {
      return 'Enter a valid expiry date (MM/YY)';
    }

    // Check if the card is expired
    final now = DateTime.now();
    final month = int.parse(value.substring(0, 2));
    final year = int.parse('20${value.substring(3)}');
    final expiryDate =
        DateTime(year, month + 1, 0); // Last day of the expiry month

    if (expiryDate.isBefore(now)) {
      return 'Card is expired';
    }

    return null;
  }

  // Validate CVV
  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty || value.length != 3) {
      return 'CVV is required';
    }
    final cvvRegex = RegExp(r'^\d{3,4}$');
    if (!cvvRegex.hasMatch(value)) {
      return 'Enter a valid CVV (3 or 4 digits)';
    }
    return null;
  }

  // Validate card type
  static String? validateCardType(EgyptianCreditCardType? value) {
    if (value == null) {
      return 'Card type is required';
    }
    return null;
  }
}
