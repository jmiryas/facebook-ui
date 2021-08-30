import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui/config/palette.dart';
import 'package:flutter_facebook_ui/models/post_model.dart';
import 'package:flutter_facebook_ui/widgets/profile_avatar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostContainer extends StatelessWidget {
  late final Post post;

  PostContainer({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _PostHeader(post: this.post),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(this.post.caption),
          ),
          this.post.imageUrl != null
              ? SizedBox.shrink()
              : SizedBox(
                  height: 6.0,
                ),
          this.post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: this.post.imageUrl!),
                )
              : SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: _PostStats(post: post),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  late final Post post;

  _PostHeader({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: ProfileAvatar(
          imageUrl: this.post.user.imageUrl,
        ),
        title: Text(
          this.post.user.name,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Row(
          children: [
            Text(
              "${this.post.timeAgo}",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 14.0,
              ),
            ),
            SizedBox(
              width: 2.0,
            ),
            Text(
              "•",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              width: 2.0,
            ),
            Icon(
              Icons.public,
              color: Colors.grey[500],
              size: 17.0,
            )
          ],
        ),
        trailing: Icon(Icons.more_horiz),
      ),
    );
  }
}

class _PostStats extends StatelessWidget {
  late final Post post;

  _PostStats({required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: Palette.facebookBlue, shape: BoxShape.circle),
              child: Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: 10.0,
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                "${this.post.likes}",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text(
              "${this.post.comments} Comments",
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              "${this.post.shares} Shares",
              style: TextStyle(color: Colors.grey[600]),
            )
          ],
        ),
        Divider(),
        Row(
          children: [
            _PostButton(
                label: "Like", onTap: () {}, icon: FontAwesomeIcons.thumbsUp),
            _PostButton(
                label: "Comment", onTap: () {}, icon: FontAwesomeIcons.comment),
            _PostButton(
                label: "Share", onTap: () {}, icon: FontAwesomeIcons.share)
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  late final String label;
  late final VoidCallback onTap;
  late final IconData icon;

  _PostButton({required this.label, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: this.onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  this.icon,
                  size: 18.0,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(this.label)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
