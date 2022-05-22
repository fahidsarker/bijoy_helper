part of bijoy_helper;

String _rearrangeUnicodeStr(String text) {
  int barrier = 0;
  int i = 0;
  while (i < text.length) {
    if (i < text.length && _is_bangla_pre_kar(text[i])) {
      int j = 1;
      while (_is_bangla_banjonborno(text[i - j])) {
        if (i - j < 0) {
          break;
        }
        if (i - j <= barrier) {
          break;
        }
        if (_is_bangla_halant(text[i - j - 1])) {
          j += 2;
        } else {
          break;
        }
      }

      String temp = text.substring(0, i - j);
      temp += text[i];
      temp += text.substring(i - j, i);
      temp += text.substring(i + 1, text.length);
      text = temp;
      barrier = i + 1;
    }
    if (i < (text.length - 1) &&
        _is_bangla_halant(text[i]) &&
        text[i - 1] == 'র' &&
        !_is_bangla_halant(text[i - 2])) {
      int j = 1;
      int foundPreKar = 0;
      while (true) {
        if (_is_bangla_banjonborno(text[i + j]) &&
            _is_bangla_halant(text[i + j + 1])) {
          j += 2;
        } else if (_is_bangla_banjonborno(text[i + j]) &&
            _is_bangla_pre_kar(text[i + j + 1])) {
          foundPreKar = 1;
          break;
        } else {
          break;
        }
      }
      String temp = text.substring(0, i - 1);
      temp += text.substring(i + j + 1, i + j + foundPreKar + 1);
      temp += text.substring(i + 1, i + j + 1);
      temp += text[i - 1];
      temp += text[i];
      temp += text.substring(i + j + foundPreKar + 1, text.length);
      text = temp;
      i += j + foundPreKar;
      barrier = i + 1;
    }
    i += 1;
  }
  return text;
}

String _toBijoyInner(String line) {
  line = line.replaceAll("ো", "ো");
  line = line.replaceAll("ৌ", "ৌ");
  line = _rearrangeUnicodeStr(line);

  _conversionMap.forEach((key, value) {
    line = line.replaceAll(key, value);
  });
  return line;
}

String _toBijoy(String unicodeStr) {
  unicodeStr = unicodeStr.replaceAll("য়", "য়").replaceAll("\u200d", "\u200c");

  final unicodeStrList = unicodeStr.split('\n');

  var result = "";

  for (final s in unicodeStrList) {
    result += _toBijoyInner(s) + '\n';
  }
  final strippedRes = result.replaceAll("\n", "");
  result = '';
  for (int i = 0; i < strippedRes.length; i++) {
    if (strippedRes.codeUnitAt(i) != 8204) {
      result += strippedRes[i];
    }
  }
  return result;
}
