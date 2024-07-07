import 'package:club_huose_ui/Model/Rooms.dart';
import 'package:club_huose_ui/Widgets/CardRoom.dart';
import 'package:flutter/material.dart';
import '../Screens/RoomScreen.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  const RoomCard({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RoomScreen(
                    room: room,
                  )));
        },
        child: CardRoom(room: room));
  }
}
