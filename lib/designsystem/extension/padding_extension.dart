import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget padding(EdgeInsets edgeInset) {
    return Padding(
      padding: edgeInset,
      child: this,
    );
  }
}
