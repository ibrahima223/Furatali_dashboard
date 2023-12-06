import 'package:dashboard_furatali/controllers/dashboard_controller.dart';
import 'package:dashboard_furatali/responsive.dart';
import 'package:dashboard_furatali/services/adminservice.dart';
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
    final adminServive = AuthService();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!Responsive.isDesktop(context))
            Material(
              child: IconButton(
                onPressed: context.read<DashboardController>().dashcontrol,
                icon: Icon(Icons.menu, color: Color(0xff18534f)),
              ),
            ),
          if (!Responsive.isMobile(context))
            Text(
              "Bienvenue, ",
              style: TextStyle(
                  color: Color(0xff18534f),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          FutureBuilder<String>(
            future: adminServive.getAdmin(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Wrap(
                  children: [
                    Text(
                      '${snapshot.data}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff18534f),
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(
                  'Erreur : ${snapshot.error}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                );
              } else {
                return CircularProgressIndicator(
                  color: Color(0xff18534f),
                );
              }
            },
          ),
          if (!Responsive.isMobile(context))
            Spacer(
              flex: Responsive.isDesktop(context) ? 2 : 1,
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
