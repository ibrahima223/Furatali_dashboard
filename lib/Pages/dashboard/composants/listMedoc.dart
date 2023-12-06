import 'package:dashboard_furatali/controllers/medoc_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/medicament.dart';
import 'headerMedoc.dart';

class ListMedoc extends StatefulWidget {
  const ListMedoc({super.key});

  @override
  State<ListMedoc> createState() => _ListMedocState();
}

class _ListMedocState extends State<ListMedoc> {
  int curentPage = 0;

  @override
  void initState() {
    getAllMedicaments();
    String adminId = '';
    super.initState();
    context.read<MedocController>().initMedocSubscription(adminId);
  }

  List<Medicament> getAllMedicaments() {
    return context.read<MedocController>().allMedoc;
  }

  @override
  Widget build(BuildContext context) {
    List<Medicament> allMedicaments = getAllMedicaments();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        margin: const EdgeInsets.all(20),
        width: 900.0,
        height: 750.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
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
              const HearderMedoc(),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 700,
                      child: PaginatedDataTable(
                        arrowHeadColor: const Color(0xff18534F),
                        columnSpacing: 16,
                        horizontalMargin: 0,
                        header: const Text(
                          "Liste des médicaments",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        columns: const [
                          DataColumn(
                            label: Text(
                              "Nom",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Catégorie",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Actions",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                        source: _MedocDataSource(
                            context, allMedicaments, curentPage),
                        rowsPerPage: 10,
                        onPageChanged: (int page) {
                          setState(() {
                            curentPage = page;
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
class _MedocDataSource extends DataTableSource {
  final BuildContext context;
  final List<Medicament> allMedoc;
  final int curentPage;

  _MedocDataSource(this.context, this.allMedoc, this.curentPage);

@override
DataRow getRow(int index) {
  final pageIndex = context.read<MedocController>().pageIndex;
  final dataIndex = pageIndex * rowsPerPage + index;

  if (dataIndex < allMedoc.length && dataIndex >= pageIndex * rowsPerPage) {
    final medoc = allMedoc[dataIndex];

    return DataRow(
      cells: [
        DataCell(
          Text(
            medoc.nom ?? "",
            style: const TextStyle(
              color: Colors.lightGreen,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataCell(
          Text(
            medoc.categorie ?? "",
            style: const TextStyle(
              color: Colors.lightGreen,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataCell(
          Text(
            medoc.description ?? '',
            style: const TextStyle(
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
                onPressed: () => _editMedoc(medoc),
                icon: const Icon(Icons.edit, color: Color(0xff18534F)),
              ),
              IconButton(
                onPressed: () => _deleteMedoc(medoc),
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  } else {
    return const DataRow(cells: []);
  }
}
  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => allMedoc.length;

  @override
  int get selectedRowCount => 0;

  void _editMedoc(Medicament medoc) {
    context.read<MedocController>().pageIndex = 2;
  }

  void _deleteMedoc(Medicament medoc) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        title: const Text(
          "Confirmation",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        alignment: Alignment.center,
        content: const Text(
          "Voulez-vous vraiment supprimer cette maladie ?",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fermer la boîte de dialogue
            },
            child: const Text(
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
            child: const Text(
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

  static const int rowsPerPage = 100;
}
