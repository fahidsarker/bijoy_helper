part of bijoy_helper;

class Unicode {
  bool isBanglaDigit(String c) {
    if (c == '০' || c == '১' || c == '২' || c == '৩' || c == '৪' || c == '৫' ||
        c == '৬' || c == '৭' || c == '৮' || c == '৯') {
      return true;
    }
    return false;
  }

  bool isBanglaPreKar(String c) {
    if (c == 'ি' || c == 'ৈ' || c == 'ে') {
      return true;
    }
    return false;
  }

  bool isBanglaPostKar(String c) {
    if (c == 'া' || c == 'ো' || c == 'ৌ' || c == 'ৗ' || c == 'ু' || c == 'ূ' ||
        c == 'ী' || c == 'ৃ') {
      return true;
    }
    return false;
  }

  bool isBanglaKar(String c) {
    if (isBanglaPreKar(c) || isBanglaPostKar(c)) {
      return true;
    }
    return false;
  }

  bool isBanglaBanjonborno(String c) {
    if (c == 'ক' || c == 'খ' || c == 'গ' || c == 'ঘ' || c == 'ঙ' || c == 'চ' ||
        c == 'ছ' || c == 'জ' || c == 'ঝ' || c == 'ঞ' || c == 'ট' || c == 'ঠ' ||
        c == 'ড' || c == 'ঢ' || c == 'ণ' || c == 'ত' || c == 'থ' || c == 'দ' ||
        c == 'ধ' || c == 'ন' || c == 'প' || c == 'ফ' || c == 'ব' || c == 'ভ' ||
        c == 'ম' || c == 'য' || c == 'র' || c == 'ল' || c == 'শ' || c == 'ষ' ||
        c == 'স' || c == 'হ' || c == 'ড়' || c == 'ঢ়' || c == 'য়' ||
        c == 'ৎ' || c == 'ং' || c == 'ঃ' || c == 'ঁ') {
      return true;
    }
    return false;
  }


  bool isBangleSorborno(String c) {
    if (c == 'অ' || c == 'আ' || c == 'ই' || c == 'ঈ' || c == 'উ' || c == 'ঊ' ||
        c == 'ঋ' || c == 'ঌ' || c == 'এ' || c == 'ঐ' || c == 'ও' || c == 'ঔ') {
      return true;
    }
    return false;
  }

  bool isBanglaNukta(String c) {
    if (c == 'ঁ') {
      return true;
    }
    return false;
  }

  bool isBanglaHalant(String c) {
    if (c == '্') {
      return true;
    }
    return false;
  }

  bool isSpace(String c) {
    if (c == ' ' || c == '\t' || c == '\n' || c == '\r') {
      return true;
    }
    return false;
  }

  bool isBanglaRef(String c) {
    if (c == '©') {
      return true;
    }
    return false;
  }

  String reArrangeUnicodeConvertedText(String str) {
    // #mb_internal_encoding("UTF-8") # force multi-byte UTF-8 encoding
    //
    // #global proConversionMap
    //
    // #for (i = 0; i < mb_strlen(str); ++i)

    int i = 0;
    while (i < mb_strlen(str)) {
      if (i < (mb_strlen(str) - 1) && mbCharAt(str, i) == 'র' &&
          isBanglaHalant(mbCharAt(str, i + 1)) &&
          isBanglaHalant(mbCharAt(str, i - 1))) {
        int j = 1;
        while (true) {
          if (i - j < 0) {
            break;
          }
          if (isBanglaBanjonborno(mbCharAt(str, i - j)) &&
              isBanglaHalant(mbCharAt(str, i - j - 1))) {
            j += 2;
          }
          else if (j == 1 && isBanglaKar(mbCharAt(str, i - j))) {
            j += 1;
          }
          else {
            break;
          }
        }
        String temp = subString(str, 0, i - j);
        temp += mbCharAt(str, i);
        temp += mbCharAt(str, i + 1);
        temp += subString(str, i - j, i);
        temp += subString(str, i + 2, mb_strlen(str));
        str = temp;
        i += 1;
        continue;
      }
      i += 1;
    }
    str = doCharMap(str, proConversionMap);

    i = 0;
    while (i < mb_strlen(str)) {
      if (i < mb_strlen(str) - 1 && mbCharAt(str, i) == 'র' &&
          isBanglaHalant(mbCharAt(str, i + 1)) &&
          !isBanglaHalant(mbCharAt(str, i - 1)) &&
          isBanglaHalant(mbCharAt(str, i + 2))) {
        int j = 1;
        while (true) {
          if (i - j < 0) {
            break;
          }

          if (isBanglaBanjonborno(mbCharAt(str, i - j)) &&
              isBanglaHalant(mbCharAt(str, i - j - 1))) {
            j += 2;
          } else if (j == 1 && isBanglaKar(mbCharAt(str, i - j))) {
            j += 1;
          } else {
            break;
          }
        }

        String temp = subString(str, 0, i - j);
        temp += mbCharAt(str, i);
        temp += mbCharAt(str, i + 1);
        temp += subString(str, i - j, i);
        temp += subString(str, i + 2, mb_strlen(str));
        str = temp;
        i += 1;
        continue;
      }

      // #  for 'Vowel + HALANT + Consonant' it should be 'HALANT + Consonant + Vowel'
      if (i > 0 && mbCharAt(str, i) == '\u09CD' &&
          (isBanglaKar(mbCharAt(str, i - 1)) ||
              isBanglaNukta(mbCharAt(str, i - 1))) && i < mb_strlen(str) - 1) {
        String temp = subString(str, 0, i - 1);
        temp += mbCharAt(str, i);
        temp += mbCharAt(str, i + 1);
        temp += mbCharAt(str, i - 1);
        temp += subString(str, i + 2, mb_strlen(str));
        str = temp;
      }

      // #  for 'RA (\u09B0) + HALANT + Vowel' it should be 'Vowel + RA (\u09B0) + HALANT'
      if (i > 0 && i < mb_strlen(str) - 1 && mbCharAt(str, i) == '\u09CD' &&
          mbCharAt(str, i - 1) == '\u09B0' &&
          mbCharAt(str, i - 2) != '\u09CD' &&
          isBanglaKar(mbCharAt(str, i + 1))) {
        String temp = subString(str, 0, i - 1);
        temp += mbCharAt(str, i + 1);
        temp += mbCharAt(str, i - 1);
        temp += mbCharAt(str, i);
        temp += subString(str, i + 2, mb_strlen(str));
        str = temp;
      }


      // #  Change pre-kar to post format suitable for unicode
      if (i < mb_strlen(str) - 1 && isBanglaPreKar(mbCharAt(str, i)) &&
          isSpace(mbCharAt(str, i + 1)) == false) {
        var temp = subString(str, 0, i);
        int j = 1;

        while ((i + j) < mb_strlen(str) - 1 &&
            isBanglaBanjonborno(mbCharAt(str, i + j))) {
          if ((i + j) < mb_strlen(str) &&
              isBanglaHalant(mbCharAt(str, i + j + 1))) {
            j += 2;
          } else {
            break;
          }
        }

        temp += subString(str, i + 1, i + j + 1);

        int l = 0;
        if (mbCharAt(str, i) == 'ে' && mbCharAt(str, i + j + 1) == 'া') {
          temp += "ো";
          l = 1;
        }
        else if (mbCharAt(str, i) == 'ে' && mbCharAt(str, i + j + 1) == "ৗ") {
          temp += "ৌ";
          l = 1;
        }
        else {
          temp += mbCharAt(str, i);
        }

        temp += subString(str, i + j + l + 1, mb_strlen(str));
        str = temp;
        i += j;
      }


      // #  nukta should be placed after kars
      if (i < mb_strlen(str) - 1 && isBanglaNukta(mbCharAt(str, i)) &&
          isBanglaPostKar(mbCharAt(str, i + 1))) {
        var temp = subString(str, 0, i);
        temp += mbCharAt(str, i + 1);
        temp += mbCharAt(str, i);
        temp += subString(str, i + 2, mb_strlen(str));
        str = temp;
      }

      i += 1;

    }



    return str;
  }

  String reArranceUnicodeTextForASCI(String str){
    var cY = 0;
    var i = 0;

    while (i < mb_strlen(str)){
      if(i<mb_strlen(str) && isBanglaPreKar(mbCharAt(str,i))){
        var j=1;
        while (isBanglaBanjonborno(mbCharAt(str,i-j))){
          if ((i-j)<0){
            break;
          }
          if ((i-j)<=cY) {
            break;
          }
          if (isBanglaHalant(mbCharAt(str,i-j-1))) {
            j += 2;
          } else {
            break;
          }
        }

        var R = subString(str,0, i-j);
        R += mbCharAt(str,i);
        R += subString(str,i-j, i);
        R += subString(str,i+1, mb_strlen(str));
        str = R;

        cY= i+1;
        continue;

      }


      if (i<(mb_strlen(str)-1) && isBanglaHalant(mbCharAt(str,i)) && mbCharAt(str,i-1)=='র' &&  !isBanglaHalant(mbCharAt(str,i-2))) {
        var j=1;
        var aZ=0;

        while (true){
          if (isBanglaBanjonborno(mbCharAt(str,i+j)) && isBanglaHalant(mbCharAt(str,i+j+1))){
            j+=2;
          }

          else if (isBanglaBanjonborno(mbCharAt(str,i+j)) && isBanglaPreKar(mbCharAt(str,i+j+1))){
            aZ=1;
            break;
          }

          else{
            break;
          }
        }

        var R  = subString(str,0, i-1);
        R += subString(str, i+j+1, i+j+aZ+1);
        R += subString(str, i+1, i+j+1);
        R += mbCharAt(str, i-1);
        R += mbCharAt(str, i);
        R += subString(str, i+j+aZ+1, mb_strlen(str));

        str = R;

        i+=(j+aZ);
        cY=i+1;
        continue;

      }
      i += 1;

    }

    return str;

    
  }

  String rearrangeRefPosition(String str){
    // Handle REF
    // Rule: REF should be placed after the banjonborno/juktokkor
    int i = 0;
    while (i < mb_strlen(str)) {
      if (i < mb_strlen(str) - 1 && isBanglaRef(mbCharAt(str, i))) {
        // Move the REF after the banjonborno/juktokkor

        // Find the first banjonborno position after the REF
        var j = 1;
        while (!isBanglaBanjonborno(mbCharAt(str, i + j))) {
          if (i + j >= mb_strlen(str)) {
            break;
          }
          j += 1;
        }

        if(i+j < mb_strlen(str)){
          // Now find the last position of the banjonborno/juktokkor
          var k = 1;
          while ((isBanglaHalant(mbCharAt(str, i + j + k)) || mbCharAt(str, i + j + k) == '&') && i + j + k < mb_strlen(str) - 1 && !isBanglaKar(mbCharAt(str, i + j + k + 1))){
            k += 2;
          }

          // Place the REF after the banjonborno/juktokkor
          var temp = subString(str, 0, i);
          temp += subString(str, i + 1, i + j);
          temp += subString(str, i + j, i + j + k);  // Add the banjonborno/juktokkor
          temp += mbCharAt(str, i);      // Add the REF
          temp += subString(str, i + j + k, mb_strlen(str));
          str = temp;
          i += j + k + 1;
        }else {
          i += 1;
        }
      } else {
        i += 1;
      }
    }
    return str;
  }

  String convertBijoyToUnicode (String srcString){
    if ( srcString.isEmpty){
      return "";
    }

    srcString = doCharMap(srcString, _preConversionMap);
    srcString = doCharMap(srcString, _conversionMap);

    srcString = reArrangeUnicodeConvertedText(srcString);
    srcString = doCharMap(srcString, postConversionMap);
    return srcString;

  }

  String convertUnicodeToBijoy(String srcString){
    if (srcString.isEmpty){
      return "";
    }


    var pattern = 'ো';
    var replacement = 'ো';
    srcString = preg_replace(pattern, replacement, srcString);

    pattern = 'ৌ';
    replacement = 'ৌ';
    srcString = preg_replace(pattern, replacement, srcString);

    pattern = 'য়';
    replacement = 'q'; // 'h়';
    srcString = preg_replace(pattern, replacement, srcString);

    pattern = 'ত্র';
    replacement = 'Î';
    srcString = preg_replace(pattern, replacement, srcString);

    pattern = '্র্য';
    replacement = 'ª¨';
    srcString = preg_replace(pattern, replacement, srcString);

    pattern = 'র্';
    replacement = '©';
    srcString = preg_replace(pattern, replacement, srcString);

    //# make correction
    srcString = reArranceUnicodeTextForASCI(srcString);

    srcString = rearrangeRefPosition(srcString);

    //#inv_conversionMap = {v: k for k, v in conversionMap.items()}
    srcString = doCharMap(srcString, _mainChars);

    return srcString;
  }

}


