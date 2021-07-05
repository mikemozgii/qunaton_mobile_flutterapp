import 'package:fixnum/fixnum.dart';

String emailValidate(String value, {bool required = false}) {
  if (value.isEmpty) return required ? 'Is Required' : null;

  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (!regex.hasMatch(value)) return 'Enter Valid Email';

  return null;
}

String numberValidate(String value, {bool required = false, Int64 maxValue}) {
  if (value.isEmpty) return required ? 'Is Required' : null;

  RegExp numeric = RegExp(r'^[0-9]+$');
  if (!numeric.hasMatch(value)) return 'Value is Incorrect';

  if (maxValue != null) {
    var val = Int64.parseInt(value);
    if (val > maxValue) return 'Max Value ' + maxValue.toString();
  }

  return null;
}

String phoneValidate(String value, {bool required = false}) {
  if (value.isEmpty) return required ? 'Is Required' : null;
  if (value.length < 10) return 'Min Length 10';
  if (value.length > 10) return 'Max Length 10';

  RegExp numeric = RegExp(r'^[0-9]+$');
  if (!numeric.hasMatch(value)) return 'Value is Incorrect';

  return null;
}

String textValidate(String value) {
  return value.isEmpty ? 'Required Text field' : null;
}

String validateEmail(String value) {
  Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value) || value == null)
    return 'Enter a valid email address';
  else
    return null;
}

String incorrectUrl(String value, String errorMessage) {
  return value.startsWith("http://") || value.startsWith("https://")
      ? null
      : errorMessage;
}

String validateCurency(String value) {
  RegExp regex = new RegExp("^\$|^(0|([1-9][0-9]{0,99}))(\\.[0-9]{0,2})?\$");
  if (!regex.hasMatch(value))
    return 'Enter Valid Value';
  else
    return null;
}
