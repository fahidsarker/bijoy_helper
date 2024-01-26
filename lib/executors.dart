part of bijoy_helper;


String _toBijoy(String unicodeStr) {
  return Unicode().convertUnicodeToBijoy(unicodeStr);
}

String _toUnicode(String bijoyStr) {
  return Unicode().convertBijoyToUnicode(bijoyStr);
}