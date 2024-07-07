import 'package:flutter/material.dart';

class TextNameClub extends StatelessWidget {
  final String nameclub;
  const TextNameClub({
    super.key,
    required this.nameclub,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      nameclub,
      style: Theme.of(context)
          .textTheme
          .labelSmall!
          .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
    );
  }
}
