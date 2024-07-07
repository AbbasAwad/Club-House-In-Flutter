import 'package:club_huose_ui/DataBase/data.dart';
import 'package:club_huose_ui/Widgets/UserProfileImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Widgets/RoomCard.dart';
import '../constant/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 28,
              )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.envelope, size: 26)),
            IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.calendar, size: 26)),
            IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.bell, size: 26)),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: UserProfileImage(
                    imageURL: currentUser.imageURL, size: 34.0),
              ),
            ),
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
              children: [
                ...roomList.map((e) => RoomCard(room: e)),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.1),
                      Theme.of(context).scaffoldBackgroundColor,
                    ])),
              ),
            ),
            Positioned(
              bottom: 30,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
                label: const Text(
                  "Start a room",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Kaccentcolor),
              ),
            )
          ],
        ));
  }
}
