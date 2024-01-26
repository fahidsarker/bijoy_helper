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
  ];
  final expecteds = [
    "Dfq cv‡k av‡bi kx‡l ‡ewóZ cvwb‡Z fvmgvb RvZxq dyj kvcjv| Zvi gv_vq cvUMv‡Qi ci¯úi mshy³ wZbwU cvZv Ges Dfh cv‡k `ywU K‡i ZviKv|",
    "wi‡cvU©",
    "Avwg e…wó fv‡jvevwm|",
    "ivRavbx XvKvh় Aew¯’Z|",
    "RvZxh় msMx‡Zi myi ‡jv‡Ki gb Qyuh‡় hvh়|",
    "K…lK ‡¶‡Z avb ‡ivcY Ki‡Q|",
    "‡m Zvi eÜyi m‡½ ‡gjv ‡`L‡Z wMh‡়wQj|",
    "Mv‡Qi cvZv¸‡jv meyR i‡Oi|",
    "evsjv fvlvh় A‡bK my›`i KweZv ih‡়‡Q|",
    "Avgv‡`i DwPZ cwi‡ek msi¶‡Y m‡PZb nIh়v|",
    "evsjv‡`‡ki BwZnvm A‡bK Mfxi Ges mg…×|",
    "ms¯‹…wZ Ges wk‡í evsjv‡`‡ki ‰ewPZª¨ j¶Yxh়|",
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
