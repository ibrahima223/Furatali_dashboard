import 'package:dashboard_furatali/Pages/dashboard/composants/headerMal.dart';
import 'package:dashboard_furatali/controllers/mal_controller.dart';
import 'package:dashboard_furatali/models/listMaladie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListMal extends StatefulWidget {
  const ListMal({Key? key}) : super(key: key);

  @override
  State<ListMal> createState() => _ListMalState();
}

class _ListMalState extends State<ListMal> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        margin: EdgeInsets.all(20),
        width: 900.0,
        height: 750.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.5),
              blurRadius: 4,
              offset: Offset(0, 0),
            )
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HearderMal(),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 700,
                      child: PaginatedDataTable(
                        arrowHeadColor: Color(0xff18534F),
                        columnSpacing: 16,
                        horizontalMargin: 0,
                        header: Text("Liste des maladies",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        columns: [
                          DataColumn(
                            label: Text("Nom_maladie",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          DataColumn(
                            label: Text("Symptômes",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          DataColumn(
                            label: Text("Traitements",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          DataColumn(
                            label: Text("Actions",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                        ],
                        source: _MaladieDataSource(context),
                        rowsPerPage: 10,
                        onPageChanged: (int page) {
                          setState(() {
                            currentPage = page;
                          });
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _MaladieDataSource extends DataTableSource {
  final BuildContext context;

  _MaladieDataSource(this.context);

  @override
  DataRow getRow(int index) {
    final mal = paginatedMalDash[index];
    return DataRow(
      cells: [
        DataCell(
          Text(
            mal.nom ?? "",
            style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataCell(
          Text(
            mal.symptomes ?? "",
            style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataCell(
          Text(
            mal.traitements ?? "",
            style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataCell(
          Row(
            children: [
              IconButton(
                  onPressed: () => _editMal(mal),
                  icon: Icon(Icons.edit, color: Color(0xff18534F))),
              IconButton(
                  onPressed: () => _deleteMal(mal),
                  icon: Icon(Icons.delete, color: Colors.red)),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => paginatedMalDash.length;

  @override
  int get selectedRowCount => 0;

  void _editMal(Maladie mal) {
    context.read<MalController>().pageIndex = 2;
  }

  void _deleteMal(Maladie mal) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        title: Text(
          "Confirmation",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        alignment: Alignment.center,
        content: Text(
          "Voulez-vous vraiment supprimer cette maladie ?",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fermer la boîte de dialogue
            },
            child: Text(
              "NON",
              style: TextStyle(
                  color: Color(0xffEB4335),
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          TextButton(
            onPressed: () {
              // context.read<MalController>().pageIndex = 0;
              Navigator.of(context).pop();
            },
            child: Text(
              "OUI",
              style: TextStyle(
                  color: Color(0xff34A853),
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  List<Maladie> get paginatedMalDash {
    final malController = context.read<MalController>();
    final startIndex = malController.pageIndex * rowsPerPage;
    final endIndex = startIndex + rowsPerPage;
    return malController.malDash.sublist(
      startIndex.clamp(0, malController.malDash.length),
      endIndex.clamp(0, malController.malDash.length),
    );
  }

  static const int rowsPerPage = 30;

  int get currentPage {
    final malController = context.read<MalController>();
    return (malController.pageIndex / rowsPerPage).floor();
  }
}
