part of bijoy_helper;


bool _is_bangla_pre_kar(String ch_unicode) {
    return ['ি', 'ৈ', 'ে'].contains(ch_unicode);
}


bool _is_bangla_banjonborno(String ch_unicode){
return ['ক', 'খ', 'গ', 'ঘ', 'ঙ', 'চ', 'ছ', 'জ', 'ঝ', 'ঞ', 'ট', 'ঠ', 'ড', 'ঢ', 'ণ', 'ত', 'থ', 'দ', 'ধ', 'ন', 'প', 'ফ', 'ব', 'ভ', 'ম', 'শ', 'ষ', 'স', 'হ', 'য', 'র', 'ল', 'য়', 'ং', 'ঃ', 'ঁ', 'ৎ'].contains(ch_unicode);
}

bool _is_bangla_halant(String ch_unicode) {
return ch_unicode == '্';
}