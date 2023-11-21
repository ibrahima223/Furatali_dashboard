import 'package:dashboard_furatali/Pages/dashboard/composants/addMedoc.dart';
import 'package:dashboard_furatali/models/medicament.dart';
import 'package:dashboard_furatali/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../AddDirectory/addmedicament.dart';
import 'MedicamentInfo.dart';

class MyFiels extends StatelessWidget {
  const MyFiels({super.key});

  @override
  Widget build(BuildContext context) {
    final Size _size= MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Médicaments actifs",
                style: TextStyle(
                    color: Color(0xff18534f),
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                ),
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xff18534f),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16/(Responsive.isMobile(context)?2: 1)),
                  elevation: 5,
                ),
                label: Text("Ajouter médicament",
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                icon: Icon(Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
                onPressed:(){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AjouterMedicament(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        SizedBox(height: 10),
        Responsive(
            mobile: InfoCardGrid(crossAxisCount: _size.width <650? 2:4,
              childAspectRatio: _size.width<650? 1.3 : 1,
            ),
            tablet: InfoCardGrid(),
            desktop: InfoCardGrid(childAspectRatio: _size.width<1400? 1.1 : 1.4,),
          key: GlobalKey(),
        )
        
      ],
    );
  }
}
class InfoMedicament extends StatelessWidget {
  const InfoMedicament({super.key, required this.medicament});
  final Medicament medicament;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                offset: Offset(0, 0),
                blurRadius: 4
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(0.9),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: medicament.color.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset(medicament.imageUrl),
              ),
            ],
          ),
          Text(
            medicament.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          ProgressBar(color: medicament.color, percentage: medicament.pourcentage),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(medicament.dosage,
                style: TextStyle(
                  color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                ),
              ),
              Text(medicament.frequence,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w600
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
 class InfoCardGrid extends StatelessWidget {
   const InfoCardGrid({super.key, this.crossAxisCount= 4, this.childAspectRatio=1});
   final int crossAxisCount;
   final double childAspectRatio ;
   @override
   Widget build(BuildContext context) {
     return  Padding(
       padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
       child: GridView.builder(
           itemCount: medicaments.length,
           physics: NeverScrollableScrollPhysics(),
           shrinkWrap: true,
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: crossAxisCount,
               crossAxisSpacing: 20,
               mainAxisSpacing: 16,
               childAspectRatio: childAspectRatio
           ),
           itemBuilder: (context, index)=>InfoMedicament(medicament: medicaments[index],)
       ),
     );
   }
 }



