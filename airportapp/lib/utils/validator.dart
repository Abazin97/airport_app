extension ExtString on String{
  bool get isValidEmail{
    final emailregExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailregExp.hasMatch(this);
  }

  bool get isValidCode{
    final codeRegExp = RegExp(r"^\d{6}$");
    return codeRegExp.hasMatch(this);
  }
}