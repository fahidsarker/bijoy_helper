import 'package:flutter_test/flutter_test.dart';

import 'package:bijoy_helper/bijoy_helper.dart';

void main() {
  final text = "উভয় পাশে ধানের শীষে বেষ্টিত পানিতে ভাসমান জাতীয় ফুল শাপলা। তার মাথায় পাটগাছের পরস্পর সংযুক্ত তিনটি পাতা এবং উভয পাশে দুটি করে তারকা।";
  final expectD = "Dfq cv‡k av‡bi kx‡l ‡ewóZ cvwb‡Z fvmgvb RvZxq dyj kvcjv| Zvi gv_vq cvUMv‡Qi ci¯úi mshy³ wZbwU cvZv Ges Dfh cv‡k `ywU K‡i ZviKv|";
  final toBijoy = unicodeToBijoy(text);

  test(
    'Bijoy text should be same as unicode text',
    () {
      expect(toBijoy, expectD);
    },
  );
}
