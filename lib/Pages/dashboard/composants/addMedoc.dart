import 'package:dashboard_furatali/controllers/medoc_controller.dart';
import 'package:dashboard_furatali/models/medicament.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddMedoc extends StatefulWidget {
  const AddMedoc({super.key});

  @override
  State<AddMedoc> createState() => _AddMedocState();
}

class _AddMedocState extends State<AddMedoc> {
  TextEditingController nom_controller = TextEditingController();
  TextEditingController description_controller = TextEditingController();
  String? selectedType;
  FocusNode myFocusNode = new FocusNode();
  var categorie;
  List<String> categories = ['Traditionnel', 'Non-traditionnel'];
  Future<void> validation(String titre, String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(titre),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        margin: EdgeInsets.all(20),
        width: 800.0,
        height: 750.0,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  blurRadius: 4,
                  offset: Offset(0, 0))
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ajouter un médicament',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff18534f),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                margin: EdgeInsets.all(20),
                width: 700.0,
                height: 600.0,
                decoration: BoxDecoration(
                    color: Color(0xff18534f),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: TextField(
                        controller: nom_controller,
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.lightGreen),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.lightGreen),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Nom du médicament',
                            hintStyle: TextStyle(
                                color: myFocusNode.hasFocus
                                    ? Colors.blue
                                    : Colors.black54)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: DropdownButtonFormField(
                        value: categorie,
                        selectedItemBuilder: (BuildContext context) {
                          return categories.map<Widget>((String item) {
                            print("$item");
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList();
                        },
                        items: categories.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (selectedItem) => setState(
                          () {
                            categorie = selectedItem!;
                          },
                        ),
                        decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.lightGreen),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Catégorie',
                            hintStyle: TextStyle(
                                color: myFocusNode.hasFocus
                                    ? Colors.blue
                                    : Colors.black54)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: TextField(
                        controller: description_controller,
                        cursorColor: Colors.blue,
                        keyboardType: TextInputType.multiline,
                        maxLines: 7,
                        decoration: InputDecoration(
                          isDense: true,
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.lightGreen),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.lightGreen),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Description",
                          hintStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.blue
                                  : Colors.black54),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0x770fac71),
                              fixedSize: Size(200, 50),
                            ),
                            onPressed: () async {
                              if (nom_controller.text.isEmpty ||
                                  categorie == null ||
                                  description_controller.text.isEmpty) {
                                validation("Erreur","Veuillez remplir tous les champs.");
                                return;
                              }
                              Medicament nouveauMedicament = Medicament(
                                idAdmin: '',
                                nom: nom_controller.text,
                                description: description_controller.text,
                                categorie: categorie,
                              );
                              try {
                                await nouveauMedicament.addmedicament();
                                validation("Succès", "Médicament ajouté avec succès");
                                setState(() {
                                  nom_controller.clear();
                                  categorie = null;
                                  description_controller.clear();
                                });
                              } catch (e) {
                                validation("Erreur", "Une erreur s'est produite lors de la création");
                              }
                            },
                            child: const Text(
                              "Ajouter",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffEB4335),
                              fixedSize: Size(200, 50),
                            ),
                            onPressed: () async {
                              context.read<MedocController>().pageIndex = 0;
                            },
                            child: const Text(
                              "Annuler",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
