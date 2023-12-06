import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DrawerListTile extends StatelessWidget{
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);
  final String title;
  final Icon icon;
  final VoidCallback press;
  @override
  Widget build (BuildContext context){
    return ListTile(
      dense: true,
      onTap: press,
      horizontalTitleGap: 10,
      leading: Icon(icon.icon,
        size: 20,
        color: const Color(0xe518534f),
      ),
      title: Text(title,
        style:const TextStyle(
            color: Color(0xe518534f),
            fontSize: 15,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}