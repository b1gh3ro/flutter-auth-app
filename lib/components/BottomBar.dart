import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          Spacer(),
          IconButton(
              icon: Icon(Icons.amp_stories_outlined),
              iconSize: 40,
              onPressed: () {
                null;
              }),
          Spacer(),
          IconButton(
              icon: Icon(Icons.add_circle_outlined),
              iconSize: 40,
              onPressed: () {
                null;
              }),
          Spacer(),
          IconButton(
              icon: Icon(Icons.account_circle_outlined),
              iconSize: 40,
              onPressed: () {
                null;
              }),
          Spacer(),
        ],
      ),
    );
  }
}
