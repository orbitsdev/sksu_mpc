import 'package:flutter/material.dart';

class SText extends StatelessWidget {
  final Text text;
  SText(
    this.text,
  );

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: text);
  }
}
