import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BadgeIcone extends StatefulWidget {
  const BadgeIcone({super.key});

  @override
  State<BadgeIcone> createState() => _BadgeIconeState();
}

class _BadgeIconeState extends State<BadgeIcone> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
          onTap: (){},
          child: Badge(
            backgroundColor: Color(0xffEB4335),
            label: Text("10",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            child: Icon(Icons.notifications,
              size: 40,
              color: Color(0xe518534f),
            ),
          ),
        ),
    );
  }
}
