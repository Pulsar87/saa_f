bool validateEmail(String value) {
  // قم بإنشاء نمط البريد الإلكتروني باستخدام التعبير العادي
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  // قم بالتحقق من تطابق النص مع نمط البريد الإلكتروني
  if (emailRegex.hasMatch(value)) {
    return true; // البريد الإلكتروني صالح
  } else {
    return false; // البريد الإلكتروني غير صالح
  }
}
