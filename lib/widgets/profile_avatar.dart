import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_facebook_ui/config/palette.dart';

class ProfileAvatar extends StatelessWidget {
  late final String imageUrl;
  late final bool isActive;
  late final bool hasBorder;

  ProfileAvatar(
      {required this.imageUrl, this.isActive = false, this.hasBorder = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: this.hasBorder ? 17.0 : 20.0,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(this.imageUrl),
          ),
        ),
        this.isActive
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  width: 15.0,
                  height: 15.0,
                  decoration: BoxDecoration(
                      color: Palette.online,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2.0, color: Colors.white)),
                ),
              )
            : SizedBox.shrink()
      ],
    );
  }
}
