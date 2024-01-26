library bijoy_helper;

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

part 'conversion_maps.dart';

part 'utils.dart';
part 'unicode.dart';

part 'executors.dart';

String unicodeToBijoy(String unicode) {
  return _toBijoy(unicode);
}

String bijoyToUnicode(String bijoy) {
  return _toUnicode(bijoy);
}

extension UnicodeBijoy on String {
  String get toBijoy => _toBijoy(this);

  String toBijoyIf(bool condition) {
    return condition ? toBijoy : this;
  }

  String get toUnicode => _toUnicode(this);

  String toUnicodeIf(bool condition) {
    return condition ? toUnicode : this;
  }
}

class BijoyText extends Text {
  BijoyText(
    String data, {
    Key? key,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    bool? toBijoyIf,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
  }) : super(
            toBijoyIf != null
                ? toBijoyIf
                    ? _toBijoy(data)
                    : data
                : _toBijoy(data),
            key: key,
            style: style,
            strutStyle: strutStyle,
            textAlign: textAlign,
            textDirection: textDirection,
            locale: locale,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,
            maxLines: maxLines,
            semanticsLabel: semanticsLabel,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: textHeightBehavior);

  const BijoyText.rich(
    BijoyTextSpan textSpan, {
    Key? key,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
  }) : super.rich(textSpan,
            key: key,
            style: style,
            strutStyle: strutStyle,
            textAlign: textAlign,
            textDirection: textDirection,
            locale: locale,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,
            maxLines: maxLines,
            semanticsLabel: semanticsLabel,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: textHeightBehavior);
}

class BijoyTextSpan extends TextSpan {
  BijoyTextSpan({
    String? text,
    List<BijoyTextSpan>? children,
    TextStyle? style,
    bool? toBijoyIf,
    GestureRecognizer? recognizer,
    MouseCursor? mouseCursor,
    PointerEnterEventListener? onEnter,
    PointerExitEventListener? onExit,
    String? semanticsLabel,
    Locale? locale,
    bool? spellOut,
  }) : super(
          text: text != null
              ? toBijoyIf != null
                  ? toBijoyIf
                      ? _toBijoy(text)
                      : text
                  : _toBijoy(text)
              : null,
          children: children,
          style: style,
          recognizer: recognizer,
          mouseCursor: mouseCursor,
          onEnter: onEnter,
          onExit: onExit,
          semanticsLabel: semanticsLabel?.toBijoyIf(toBijoyIf ?? true),
          locale: locale,
          spellOut: spellOut,
        );
}
