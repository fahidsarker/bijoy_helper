import 'package:flutter_test/flutter_test.dart';

import 'package:bijoy_helper/bijoy_helper.dart';

void main() {
  final texts = [
    "উভয় পাশে ধানের শীষে বেষ্টিত পানিতে ভাসমান জাতীয় ফুল শাপলা। তার মাথায় পাটগাছের পরস্পর সংযুক্ত তিনটি পাতা এবং উভয পাশে দুটি করে তারকা।",
    "রিপোর্ট",
    "আমি বৃষ্টি ভালোবাসি।", 
    "রাজধানী ঢাকায় অবস্থিত।", 
    "জাতীয় সংগীতের সুর লোকের মন ছুঁয়ে যায়।", 
    "কৃষক ক্ষেতে ধান রোপণ করছে।", 
    "সে তার বন্ধুর সঙ্গে মেলা দেখতে গিয়েছিল।", 
    "গাছের পাতাগুলো সবুজ রঙের।", 
    "বাংলা ভাষায় অনেক সুন্দর কবিতা রয়েছে।", 
    "আমাদের উচিত পরিবেশ সংরক্ষণে সচেতন হওয়া।",
    "বাংলাদেশের ইতিহাস অনেক গভীর এবং সমৃদ্ধ।", 
    "সংস্কৃতি এবং শিল্পে বাংলাদেশের বৈচিত্র্য লক্ষণীয়।",
    "কিছু নিরর্থক শব্দঃ বৈচিত্র, বৈচিত্র্য, বৈচিন্র্য বক্র‍্য, রিপোর্ট, কার্যালয়, ধার্ক্কা, মুর্চ্ছার্দ্ধন্ম, মুর্চ্ছার্দ্ধান্ম, মুর্চ্ছুর্দ্ধান্ম ।"
  ];
  final expecteds = [
    "Dfq cv‡k av‡bi kx‡l ‡ewóZ cvwb‡Z fvmgvb RvZxq dyj kvcjv| Zvi gv_vq cvUMv‡Qi ci¯úi mshy³ wZbwU cvZv Ges Dfh cv‡k `ywU K‡i ZviKv|",
    "wi‡cvU©",
    "Avwg e…wó fv‡jvevwm|",
    "ivRavbx XvKvq Aew¯’Z|",
    "RvZxq msMx‡Zi myi ‡jv‡Ki gb Qyu‡q hvq|",
    "K…lK ‡¶‡Z avb ‡ivcY Ki‡Q|",
    "‡m Zvi eÜyi m‡½ ‡gjv ‡`L‡Z wM‡qwQj|",
    "Mv‡Qi cvZv¸‡jv meyR i‡Oi|",
    "evsjv fvlvq A‡bK my›`i KweZv i‡q‡Q|",
    "Avgv‡`i DwPZ cwi‡ek msi¶‡Y m‡PZb nIqv|",
    "evsjv‡`‡ki BwZnvm A‡bK Mfxi Ges mg…×|",
    "ms¯‹…wZ Ges wk‡í evsjv‡`‡ki ‰ewPÎ¨ j¶Yxq|",
    "wKQy wbi_©K kãt ‰ewPÎ, ‰ewPÎ¨, ‰ewPbª¨ eµ‍¨, wi‡cvU©, Kvh©vjq, av°©v, gy”Q©v×©b¥, gy”Q©v×©vb¥, gy”Q©y×©vb¥ |",
  ];

  for (int i=0; i<texts.length; i++) {

  test(
    'Bijoy text should be same as unicode texts for ${texts[i]}',
    () {
        final toBijoy = unicodeToBijoy(texts[i]);
        expect(toBijoy, expecteds[i]);
    },
  );
  }

}
