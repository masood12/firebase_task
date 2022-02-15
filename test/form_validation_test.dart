
import 'package:firebasetask/core/utils/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('empty email returns error string', () {

    final result = FormValidators.instance.validateEmail('');
    expect(result, 'Email cant be empty');
  });


  test('invalid email returns error string', () {

    final result = FormValidators.instance.validateEmail('masood@');
    expect(result, 'Invalid Email Address');
  });

  test('non-empty email returns null', () {

    final result = FormValidators.instance.validateEmail('masood@gmail.com');
    expect(result, null);
  });


  test('empty password returns error string', () {

    final result = FormValidators.instance.validatePassword('');
    expect(result, 'Password cant be empty');
  });

  test('invalid password returns error string', () {

    final result = FormValidators.instance.validatePassword('test1');
    expect(result, 'Password should not be less than 5 char');
  });

  test('non-empty password returns null', () {

    final result = FormValidators.instance.validatePassword('password');
    expect(result, null);
  });
}