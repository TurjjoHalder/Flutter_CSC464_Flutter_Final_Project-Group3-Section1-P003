class CustomValidators {
  
  static String? validateCustomerName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a customer name';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    else if(!RegExp(r'^\d{5}$').hasMatch(value)) {
      return 'Please enter a valid 5-digit phone number';
    }
    return null;
  }

  static String? validateAssignedTo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the name of the person assigned to the task';
    }
    return null;
  }


  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a customer address';
    }


    
    return null;
  }




}