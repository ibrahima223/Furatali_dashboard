import 'package:flutter/material.dart';
class Statistiques extends StatelessWidget {
  const Statistiques({super.key, required this.title, required this.amontOfFiles, required this.icon, required this.iconColor,});
  final String title, amontOfFiles;
  final Icon icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: Padding(
              padding:  EdgeInsets.only(left: 15, bottom: 20),
              child: Icon(icon.icon,
                size: 25,
                color: iconColor,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(amontOfFiles,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: 15
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

