import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui/widgets/profile_avatar.dart';

import '../models/user_model.dart';

class CreatePostContainer extends StatelessWidget {
  late final User currentUser;

  CreatePostContainer({required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: this.currentUser.imageUrl),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: "What's on your mind?"),
                ),
              )
            ],
          ),
          Divider(
            thickness: 0.5,
            height: 10.0,
          ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label:
                        Text("Live", style: TextStyle(color: Colors.black54))),
                VerticalDivider(
                  width: 8.0,
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label:
                        Text("Photo", style: TextStyle(color: Colors.black54))),
                VerticalDivider(
                  width: 8.0,
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.video_call,
                      color: Colors.purpleAccent,
                    ),
                    label:
                        Text("Room", style: TextStyle(color: Colors.black54))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
