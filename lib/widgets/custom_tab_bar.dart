import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  late final List<IconData> icons;
  late final int selectedIndex;
  late final Function(int) onTap;

  CustomTabBar(
      {required this.icons, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TabBar(
        onTap: this.onTap,
        indicatorPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
            border: Border(
                top: BorderSide(color: Palette.facebookBlue, width: 3.0))),
        tabs: this
            .icons
            .asMap()
            .map((index, value) => MapEntry(
                index,
                Tab(
                  icon: Icon(
                    value,
                    color: index == selectedIndex
                        ? Palette.facebookBlue
                        : Colors.black45,
                  ),
                )))
            .values
            .toList());
  }
}
