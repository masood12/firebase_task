class FormValidators {
  FormValidators._();

  static FormValidators instance = FormValidators._();

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password cant be empty';
    }else if(value.length<6){
      return "Password should not be less than 5 char";
    }
    return null;
  }

  String? emptyCheck(String? value) {
    if (value!.isEmpty) {
      return 'required *';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email cant be empty';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return "Invalid Email Address";
    }
    return null;
  }
}
