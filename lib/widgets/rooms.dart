import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_facebook_ui/config/palette.dart';
import 'package:flutter_facebook_ui/models/user_model.dart';
import 'package:flutter_facebook_ui/widgets/profile_avatar.dart';

class Rooms extends StatelessWidget {
  late final List<User> onlineUsers;

  Rooms({required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
          itemCount: 1 + this.onlineUsers.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }

            final User user = this.onlineUsers[index - 1];

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          }),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
            primary: Palette.facebookBlue,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            side: BorderSide(color: Colors.blue.shade300, width: 3.0)),
        child: Row(
          children: [
            ShaderMask(
                shaderCallback: (rect) =>
                    Palette.createRoomGradient.createShader(rect),
                child: Icon(Icons.video_call, size: 35.0, color: Colors.white)),
            SizedBox(
              width: 4.0,
            ),
            Text("Create\nRoom")
          ],
        ));
  }
}
