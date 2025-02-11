import 'package:flutter/material.dart';

bool containsInitialConsonant(String string, String query) {
  /*
      Hangul UTF16 structure :
      ① Hangul characters start from 44032(== '가').
      ② A group of same initial consonant has 588 characters.
      ③ Initial consonants are 19ea,
        such as 'ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ'
      ④ Hangul initial consonant characters start from 12593 to 12622
        'ㄱ', 'ㄲ', 'ㄳ', 'ㄴ', 'ㄵ', 'ㄶ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㄺ', 'ㄻ', 'ㄼ', 'ㄽ', 'ㄾ', 'ㄿ', 'ㅀ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅄ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ',
    */
  const codeOfFirstHangulLetter = 44032;
  const numberOfSameInitialConsonant = 588;
  final initialConsonants = [
    'ㄱ',
    'ㄲ',
    'ㄴ',
    'ㄷ',
    'ㄸ',
    'ㄹ',
    'ㅁ',
    'ㅂ',
    'ㅃ',
    'ㅅ',
    'ㅆ',
    'ㅇ',
    'ㅈ',
    'ㅉ',
    'ㅊ',
    'ㅋ',
    'ㅌ',
    'ㅍ',
    'ㅎ'
  ];

  if (string.length < query.length) {
    return false;
  }

  if (query.isEmpty) return true;

  for (int i = 0; i < string.length - query.length + 1; i++) {
    bool contains = true;
    for (int j = 0; j < query.length; j++) {
      if (initialConsonants.contains(query.substring(j, j + 1))) {
        if ((string.substring(i + j, i + j + 1).codeUnitAt(0) -
                    codeOfFirstHangulLetter) ~/
                numberOfSameInitialConsonant !=
            initialConsonants.indexOf(query.substring(j, j + 1))) {
          contains = false;
          break;
        }
      } else {
        if (query.substring(j, j + 1) != string.substring(i + j, i + j + 1)) {
          contains = false;
          break;
        }
      }
    }
    if (contains) return true;
  }
  return false;
}

double calculateTextWidth(BuildContext context, String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: 1,
    textScaleFactor: MediaQuery.of(context).textScaleFactor,
    textDirection: TextDirection.ltr,
  )..layout(); // 레이아웃을 계산해야 크기를 얻을 수 있음

  return textPainter.width;
}
