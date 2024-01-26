part of bijoy_helper;

String doCharMap(String text, Map<String, String> charMap) {
  charMap.forEach((srcKey, keyVal) {
    text = text.replaceAll(RegExp(srcKey), keyVal);
  });
  return text;
}

int mb_strlen(String str) {
  return str.length;
}

String mbCharAt(String str, int i) {
  if (i < 0 || i >= str.runes.length) {
    return '';
  }
  return String.fromCharCode(str.runes.elementAt(i));
}


String subString(String string, int frm, int to) {
  return string.substring(frm, to);
}

String preg_replace(String srcKey, String keyVal, String text) {
  return text.replaceAll(RegExp(srcKey), keyVal);
}