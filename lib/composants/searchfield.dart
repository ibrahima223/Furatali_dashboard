import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextField(
            cursorColor: Color(0xe518534f),
            decoration: InputDecoration(
                hintText: "Rechercher...",
                hintStyle: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    fontSize: 20,
                    fontWeight: FontWeight.w300
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xe518534f))
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xe518534f))
                ),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                suffixIcon: InkWell(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xe518534f),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(Icons.search,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                )
            ),
          ),
    );
  }
}
