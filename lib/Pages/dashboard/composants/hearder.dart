import 'package:dashboard_furatali/dashboard_controller.dart';
import 'package:dashboard_furatali/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../composants/BadgeIcon.dart';
import '../../../composants/ProfileAvatar.dart';
import '../../../composants/searchfield.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if(!Responsive.isDesktop(context))
            Material(
            child: IconButton(
              onPressed:context.read<DashboardController>().dashcontrol,
              icon: Icon(Icons.menu,
                color:Color(0xff18534f)
              ),
            ),
          ),
          if(!Responsive.isMobile(context))
          Text("Bienvenue, M.User",
            style: TextStyle(
                color: Color(0xff18534f),
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
          if(!Responsive.isMobile(context))
          Spacer(
            flex: Responsive.isDesktop(context)? 2: 1,
          ),
          Expanded(
            child: SearchField(),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BadgeIcone(),
                ProfileAvatar(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
