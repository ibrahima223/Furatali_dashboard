import 'package:dashboard_furatali/controllers/mal_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MalPages extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return context.watch<MalController>().pageToShow;
  }
}