import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  final String imageURL;
  final double size;

  const UserProfileImage({
    super.key,
    required this.imageURL,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2 - size / 10),
      child: Image.network(
        imageURL,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
