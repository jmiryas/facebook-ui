import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui/config/palette.dart';
import 'package:flutter_facebook_ui/models/models.dart';
import 'package:flutter_facebook_ui/widgets/profile_avatar.dart';

class Stories extends StatelessWidget {
  late final User currentUser;
  late final List<Story> stories;

  Stories({required this.currentUser, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.white,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          itemCount: 1 + this.stories.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: _StoryCard(
                  currentUser: this.currentUser,
                  isAddStory: true,
                ),
              );
            }

            Story story = this.stories[index - 1];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(
                currentUser: this.currentUser,
                story: story,
                isAddStory: false,
              ),
            );
          }),
    );
  }
}

class _StoryCard extends StatelessWidget {
  late final User currentUser;
  late final bool isAddStory;
  late final Story? story;

  _StoryCard({required this.currentUser, this.story, this.isAddStory = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
              height: double.infinity,
              width: 110.0,
              fit: BoxFit.cover,
              imageUrl: this.isAddStory
                  ? this.currentUser.imageUrl
                  : story!.imageUrl),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(12.0)),
        ),
        Positioned(
            top: 8.0,
            left: 8.0,
            child: this.isAddStory
                ? Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Icon(
                      Icons.add,
                      color: Palette.facebookBlue,
                    ),
                  )
                : ProfileAvatar(
                    imageUrl: this.story!.imageUrl,
                    hasBorder: this.story!.isViewed,
                  )),
        Positioned(
            bottom: 8.0,
            left: 8.0,
            right: 8.0,
            child:
                Text(this.isAddStory ? "Add to Story" : this.story!.user.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )))
      ],
    );
  }
}
