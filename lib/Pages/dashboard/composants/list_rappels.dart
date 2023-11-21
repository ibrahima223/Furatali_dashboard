import 'package:flutter/material.dart';

import '../../../models/rappel.dart';

class RecentPrises extends StatelessWidget {
  const RecentPrises({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Color(0xff18534F),
            borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Rappels récents",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: DataTable(
                  columnSpacing: 16,
                  horizontalMargin: 0,
                  columns: [
                    DataColumn(label: Text("Utilisateurs",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    )),
                    DataColumn(label: Text("Médicaments",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    )),
                    DataColumn(label: Text("Dose",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    )),
                    DataColumn(label: Text("Heure",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    )),
                  ],
                  rows: List.generate(rappels.length, (index) =>recent_rappel(rappels[index]))
              ),
            )
          ],
        ),
      ),
    );
  }
}

DataRow recent_rappel (Rappel rappel){
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(rappel.imageUrl),
              radius: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(rappel.userName,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
      DataCell(Text(rappel.title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500
        ),
      )),
      DataCell(Text(rappel.dose,
        style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500
        ),
      )),
      DataCell(Text(rappel.heure,
        style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500
        ),
      )),
    ],
  );
}