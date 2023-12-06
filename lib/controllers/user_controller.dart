import 'package:dashboard_furatali/models/user.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoggedUserController extends GetxController {

  final _loggedUser = LoggedUser().obs;

  LoggedUser get loggedUser => _loggedUser.value;

  set loggedUser(LoggedUser value) => _loggedUser.value = value;

}