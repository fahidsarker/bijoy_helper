part of bijoy_helper;

/// Represents a segment of text with information about its language type
class TextSegment {
  /// The actual text content
  final String text;
  
  /// Whether the text is in Bangla
  final bool isBangla;

  /// Creates a new text segment
  const TextSegment({
    required this.text,
    required this.isBangla,
  });

  @override
  String toString() => 'TextSegment(text: $text, isBangla: $isBangla)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TextSegment &&
        other.text == text &&
        other.isBangla == isBangla;
  }

  @override
  int get hashCode => text.hashCode ^ isBangla.hashCode;
}

/// A utility class to process mixed Bangla-English text
class BanglaTextProcessor {
  /// Regular expression to match Bangla text blocks including surrounding spaces
  static final RegExp _banglaRegExp = RegExp(r'(\s*[০-৯\u0980-\u09FF\u0964]+\s*)');

  /// Processes mixed Bangla-English text and returns segments with conversion information
  /// 
  /// Returns a list of [TextSegment]s, each containing the text and whether it's Bangla
  static List<TextSegment> processText(String text) {
    List<TextSegment> segments = [];
    String remaining = text;

    while (remaining.isNotEmpty) {
      Match? match = _banglaRegExp.firstMatch(remaining);
      if (match != null) {
        // Add non-Bangla text before match
        String beforeMatch = remaining.substring(0, match.start);
        if (beforeMatch.isNotEmpty) {
          segments.add(TextSegment(
            text: beforeMatch,
            isBangla: false,
          ));
        }

        // Process Bangla text
        try {
          String banglaText = match.group(0)!;
          String bijoyText = _toBijoy(banglaText);
          segments.add(TextSegment(
            text: bijoyText,
            isBangla: true,
          ));
        } catch (e) {
          segments.add(TextSegment(
            text: match.group(0)!,
            isBangla: true,
          ));
        }

        remaining = remaining.substring(match.end);
      } else {
        // Add remaining non-Bangla text
        segments.add(TextSegment(
          text: remaining,
          isBangla: false,
        ));
        break;
      }
    }
    
    return segments;
  }
} 