import 'package:flutter/material.dart';

class NameSpeaker extends StatelessWidget {
  final String firstName;
  final String lastName;

  const NameSpeaker({
    super.key,
    required this.firstName,
    required this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${firstName} ${lastName}",
          style:
              Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16.0),
        ),
        Icon(
          Icons.contactless_rounded,
          color: Colors.grey[400],
        )
      ],
    );
  }
}
