import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import '../Constants/Constants.dart';




class ListEmployeeScreen extends StatelessWidget {
   const ListEmployeeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.amber.shade700,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("ALL EMPLOYEES",
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 25,
                color: Colors.white
            ),
          ),
          centerTitle: true,
        ),
        body: FirebaseAnimatedList(
          defaultChild: const Center(child: CircularProgressIndicator(
            color: Colors.white,
          )),
            query: Const().query,
            itemBuilder: (
                BuildContext context,
                DataSnapshot snapshot,
                Animation<double> animation,
                int index)
            {

              Map employee = snapshot.value as Map;
              String name = employee["name"];
              int year = int.parse(employee["years"]);
              bool active = employee["active"];
              bool flag = employeeStatus(active,year);
              return
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    tileColor: Colors.white,
                    title: Text("Name: $name",
                      style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                          color: Colors.grey
                      ),
                    ),
                    subtitle: Text("Exp Years: ${year.toString()}",
                      style:  TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Colors.amber.shade700
                      ),
                    ),
                    trailing: Icon(
                      Icons.flag_rounded,
                      color: flag ? Colors.green:Colors.red,
                    ),
                  ),
                );
            }
        ) ,
      );
  }
}

bool employeeStatus(bool active, int years){
  if(active && years >=5 ){
    return true;
  }else{
    return false;
  }
}
