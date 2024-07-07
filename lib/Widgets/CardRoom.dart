import 'package:club_huose_ui/Model/Rooms.dart';
import 'package:club_huose_ui/Widgets/TextClub.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomNameSpeaker.dart';
import 'TextNameClub.dart';
import 'UserProfileImage.dart';

class CardRoom extends StatelessWidget {
  final Room room;
  const CardRoom({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              TextClub(club: room.club.toUpperCase()),
              const SizedBox(width: 7),
              Icon(Icons.home, size: 15, color: Colors.green[800])
            ]),
            TextNameClub(nameclub: room.name),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 100,
                  child: Stack(children: [
                    UserProfileImage(
                        imageURL: room.speakers[0].imageURL, size: 48),
                    Positioned(
                        top: 24.0,
                        left: 28.0,
                        child: UserProfileImage(
                            imageURL: room.speakers[1].imageURL, size: 48))
                  ]),
                )),
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...room.speakers.map((e) => NameSpeaker(
                                  firstName: e.firstName,
                                  lastName: e.lastName,
                                )),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text:
                                      "${room.speakers.length + room.followedBySpeakers.length + room.others.length} "),
                              WidgetSpan(
                                  child: Icon(
                                CupertinoIcons.person_2_fill,
                                color: Colors.grey[400],
                                size: 16,
                              )),
                              TextSpan(text: " / ${room.speakers.length} "),
                              WidgetSpan(
                                  child: Icon(
                                CupertinoIcons.chat_bubble_fill,
                                color: Colors.grey[400],
                                size: 16,
                              )),
                            ]))
                          ]),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
