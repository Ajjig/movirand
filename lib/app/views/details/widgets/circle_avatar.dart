import 'package:flutter/material.dart';

  CircleAvatar actorCircleAvatar(String profilePath, {double radius = 20}) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(
        profilePath,
      ),
    );
  }