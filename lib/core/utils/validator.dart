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
}