import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMaladie extends StatefulWidget {
  const AddMaladie({super.key});

  @override
  State<AddMaladie> createState() => _AddMedocState();
}

class _AddMedocState extends State<AddMaladie> {
  String? selectedType;
  FocusNode myFocusNode = new FocusNode();
  var symptome;
  List<String> symptomes=[
    'Fièvre',
    'Fatigue',
    'Douleurs corporelles',
    'Toux',
    'Maux de tête',
    'Nausées et vomissements',
    'Perte de poids inexpliquée',
    'Problèmes de sommeil',
    'Problèmes de vision',
    'Sensibilité à la lumière',
    'Symptômes gastro-intestinaux',
    'Problèmes urinaires',
    'Palpitations'
  ];
  var traitement;
  List<String> traitements=[
    "Médicaments",
    "Chirurgie",
    "Thérapie physique",
    "Chimiothérapie"
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Expanded(
        child: Container(
          margin: EdgeInsets.all(20),
          width: 900.0,
          height: 900.0,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    blurRadius: 4,
                    offset: Offset(0, 0)
                )
              ],
              borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Ajouter une maladie',
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
                  width: 800.0,
                  height: 700.0,
                  decoration: BoxDecoration(
                      color: Color(0xff18534f),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: TextField(
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.lightGreen
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.lightGreen
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Nom de la maladie',
                              hintStyle: TextStyle(
                                  color: myFocusNode.hasFocus ? Colors.blue : Colors.black54
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: DropdownButtonFormField(
                          key: GlobalKey(),
                          value: symptome,
                          selectedItemBuilder: (BuildContext context) {
                            return symptomes.map<Widget>((String item) {
                              print("$item");
                              return DropdownMenuItem(value: item, child: Text(item));
                            }).toList();
                          },
                          items: symptomes.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (selectedItem)=> setState(
                                () {
                              symptome = selectedItem!;
                            },
                          ),
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.lightGreen
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Symptômes',
                              hintStyle: TextStyle(
                                  color: myFocusNode.hasFocus ? Colors.blue : Colors.black54
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: DropdownButtonFormField(
                          key: GlobalKey(),
                          value: traitement,
                          selectedItemBuilder: (BuildContext context) {
                            return traitements.map<Widget>((String item) {
                              print("$item");
                              return DropdownMenuItem(value: item, child: Text(item));
                            }).toList();
                          },
                          items: traitements.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (selectedItem)=> setState(
                                () {
                              traitement = selectedItem!;
                            },
                          ),
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.lightGreen
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Traitements',
                              hintStyle: TextStyle(
                                  color: myFocusNode.hasFocus ? Colors.blue : Colors.black54
                              )
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(30),
                        child:TextField(
                          cursorColor: Colors.blue,
                          keyboardType: TextInputType.multiline,
                          maxLines: 7,
                          decoration: InputDecoration(
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.lightGreen
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.lightGreen
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Description",
                            hintStyle: TextStyle(
                                color: myFocusNode.hasFocus ? Colors.blue : Colors.black54
                            ),
                          ),
                        ) ,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0x770fac71),
                            fixedSize: Size(200, 50),
                          ),
                          onPressed: () async {
                            // medicament nouveauMedicament = medicament(
                            //   id: '',
                            //   nom: nom_controller.text,
                            //   description: description_controller.text,
                            //   categorie: categorie,
                            //   idUser: '',
                            // );

                            // try {
                            //   await nouveauMedicament.create();
                            //   validation("Succès", "Médicament ajouté avec succès", '');
                            //   setState(() {
                            //     _formKey.currentState?.reset();
                            //     _formKey2.currentState?.reset();
                            //     _formKey3.currentState?.reset();
                            //     nom_controller.clear();
                            //     categorie = null;
                            //     description_controller.clear();
                            //   });
                            //
                            // } catch (e) {
                            //   validation("Erreur", "Une erreur s'est produite lors de la création",'assets/images/err.png');
                            // }
                          },
                          child: Text("Ajouter",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
