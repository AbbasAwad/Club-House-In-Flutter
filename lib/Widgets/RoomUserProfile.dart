import 'package:flutter/material.dart';
import 'UserProfileImage.dart';

class RoomUserProfile extends StatelessWidget {
  final String imageURL;
  final String name;
  final double size;
  final bool isNew;
  final bool isMute;

  const RoomUserProfile({
    super.key,
    required this.imageURL,
    required this.name,
    this.size = 42,
    this.isNew = false,
    this.isMute = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: UserProfileImage(imageURL: imageURL, size: size),
        ),
        if (isNew)
          Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 4)
                    ]),
                child: Icon(
                  Icons.celebration,
                  color: Colors.amber[600],
                  size: 20,
                ),
              )),
        if (isMute)
          Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 4)
                    ]),
                child: Icon(
                  Icons.mic_off_outlined,
                  color: Colors.red[900],
                  size: 20,
                ),
              ))
      ]),
      Flexible(child: Text(name, overflow: TextOverflow.ellipsis))
    ]);
  }
}
