import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui/models/post_model.dart';
import 'package:flutter_facebook_ui/widgets/post_container.dart';
import 'package:flutter_facebook_ui/widgets/rooms.dart';
import 'package:flutter_facebook_ui/widgets/stories.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../data/data.dart';
import '../config/palette.dart';
import '../widgets/circle_button.dart';
import '../widgets/create_post_container.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              "facebook",
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(icon: Icons.search, size: 30.0, onPressed: () {}),
              CircleButton(
                  icon: FontAwesomeIcons.facebookMessenger,
                  size: 25.0,
                  onPressed: () {})
            ],
          ),
          SliverToBoxAdapter(
              child: CreatePostContainer(
            currentUser: currentUser,
          )),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(onlineUsers: onlineUsers),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Stories(
                currentUser: currentUser,
                stories: stories,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            Post post = posts[index];
            return PostContainer(post: post);
          }, childCount: posts.length))
        ],
      ),
    );
  }
}
