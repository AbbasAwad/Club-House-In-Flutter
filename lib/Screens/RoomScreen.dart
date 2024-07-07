import 'dart:math';

import 'package:club_huose_ui/DataBase/data.dart';
import 'package:club_huose_ui/Model/Rooms.dart';
import 'package:club_huose_ui/Widgets/RoomUserProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Widgets/TextClub.dart';
import '../Widgets/TextNameClub.dart';
import '../Widgets/UserProfileImage.dart';

class RoomScreen extends StatelessWidget {
  final Room room;
  const RoomScreen({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 130,
        leading: TextButton.icon(
          style: TextButton.styleFrom(
              iconColor: Colors.black,
              textStyle: const TextStyle(color: Colors.black)),
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(CupertinoIcons.chevron_down),
          label: const Text("Hallway"),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(CupertinoIcons.doc, size: 26)),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child:
                  UserProfileImage(imageURL: currentUser.imageURL, size: 34.0),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(40.0)),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  TextClub(club: room.club.toUpperCase()),
                  const SizedBox(width: 7),
                  Icon(Icons.home, size: 15, color: Colors.green[800]),
                ]),
                const Row(children: [
                  Icon(CupertinoIcons.ellipsis, size: 15, color: Colors.black),
                ]),
              ]),
              TextNameClub(nameclub: room.name),
            ]),
          ),
          SliverPadding(
              padding: const EdgeInsets.all(14.0),
              sliver: SliverGrid.count(
                  crossAxisCount: 3,
                  children: room.speakers
                      .map((e) => RoomUserProfile(
                            imageURL: e.imageURL,
                            name: e.firstName,
                            size: 66,
                            isNew: Random().nextBool(),
                            isMute: Random().nextBool(),
                          ))
                      .toList())),
          const SliverToBoxAdapter(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextNameClub(nameclub: "Followed By Speakers"),
            ]),
          ),
          SliverPadding(
              padding: const EdgeInsets.all(14.0),
              sliver: SliverGrid.count(
                  crossAxisCount: 4,
                  childAspectRatio: 0.7,
                  children: room.followedBySpeakers
                      .map((e) => RoomUserProfile(
                            imageURL: e.imageURL,
                            name: e.firstName,
                            size: 66,
                            isNew: Random().nextBool(),
                            isMute: Random().nextBool(),
                          ))
                      .toList())),
          const SliverToBoxAdapter(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextNameClub(nameclub: "Others in The Room"),
            ]),
          ),
          SliverPadding(
              padding: const EdgeInsets.all(14.0),
              sliver: SliverGrid.count(
                  crossAxisCount: 4,
                  childAspectRatio: 0.7,
                  children: room.others
                      .map((e) => RoomUserProfile(
                            imageURL: e.imageURL,
                            name: e.firstName,
                            size: 66,
                            isNew: Random().nextBool(),
                            isMute: Random().nextBool(),
                          ))
                      .toList())),
          const SliverPadding(padding: EdgeInsets.only(bottom: 30)),
        ]),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        height: 70,
        child: Row(
          children: [
            Icon(CupertinoIcons.hand_raised_fill, color: Colors.amber[600]),
            TextButton(
              onPressed: () {},
              child: const Text(
                " Leave Quietly",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(width: 120),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey[300]),
                    padding: const EdgeInsets.all(8.0),
                    child: const Icon(Icons.add),
                  ),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey[300]),
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(CupertinoIcons.hand_raised_fill,
                        color: Colors.grey[600]),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
