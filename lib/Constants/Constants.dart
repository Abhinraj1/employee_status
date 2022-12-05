import 'package:firebase_database/firebase_database.dart';

class Const{
  final Query query = FirebaseDatabase.instance.ref().child('Employees');

}

