import 'package:dashboard_furatali/controllers/mal_controller.dart';
import 'package:dashboard_furatali/controllers/medoc_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/dashboard_controller.dart';

class HearderMal extends StatefulWidget {
  const HearderMal({super.key});

  @override
  State<HearderMal> createState() => _HearderMalState();
}

class _HearderMalState extends State<HearderMal> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 15),
            child: TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  hintText: "Rechercher...",
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xe518534f))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xe518534f))),
                  fillColor: Color(0xe518534f),
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  suffixIcon: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.search,
                        size: 25,
                        color: Color(0xe518534f),
                      ),
                    ),
                  )),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 20, right: 15),
            child: Container(
              height: 85,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ElevatedButton.icon(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(color: Colors.white),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xff18534f),
                  // fixedSize: Size(50, 50),
                  // padding: EdgeInsets.symmetric(horizontal: 24,
                  //     vertical: 16/(Responsive.isMobile(context)?2: 1)
                  // ),
                  elevation: 5,
                ),
                label: Text(
                  "Ajouter",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                icon: Icon(
                  Icons.add,
                  size: 25,
                  color: Colors.white,
                ),
                onPressed: () {
                  context.read<MalController>().pageIndex = 1;
                  // Navigator.of(context).push(
                  //   PageRouteBuilder(pageBuilder: (context, _, __) => const AjouterMedicament(), transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero)
                  //   // MaterialPageRoute(
                  //   //   builder: (context) => const AjouterMedicament(),
                  //   // ),
                  // );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
