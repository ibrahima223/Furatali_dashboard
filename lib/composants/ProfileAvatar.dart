import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({super.key});

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
          onTap: (){},
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile1.jpg'),
            radius: 30,
          ),
        ),
    );
  }
}

