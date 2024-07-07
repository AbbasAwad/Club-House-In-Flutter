import 'package:flutter/material.dart';

class TextClub extends StatelessWidget {
  final String club;
  const TextClub({
    super.key,
    required this.club,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      club,
      style: Theme.of(context).textTheme.labelSmall!.copyWith(
          fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 1.0),
    );
  }
}
