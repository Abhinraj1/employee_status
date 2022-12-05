import 'package:employee_status/Screens/List_Employee_Screen.dart';
import 'package:employee_status/Screens/Widgets/Custom_TextField.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../Manager/Route_Manager.dart';
import '../utils/SnackBar.dart';



class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  late DatabaseReference ref;
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    ref = FirebaseDatabase.instance.ref().child("Employees");
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.amber.shade700,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("Enter Employee Details",
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 25,
                color: Colors.white
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            CustomTextField(
              hint: "Enter Name",
              controller: _nameController,
            ),

            CustomTextField(
              hint: "Enter Year",
              isNumber: true,
              controller: _yearController,),
            SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Employee Active Status",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                  Checkbox(
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                      activeColor: Colors.white,
                      checkColor: Colors.amber.shade800,
                      value: isActive,
                      onChanged: (value) async{
                        isActive = value!;
                        setState(() {});
                      }),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                width: 310,
                decoration: BoxDecoration(
                    color: Colors.redAccent.shade100,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Note: Check if the Employee is active and uncheck is the employee is inactive",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: MaterialButton(
                onPressed: (){
                  _onTap();
                },
                height: 50,
                minWidth: 200,
                color: Colors.white,
                child: Text("Upload",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Colors.amber.shade700
                  ),
                ),),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.white,
          onPressed: (){
            nav(
                context: context,
                widget:  const ListEmployeeScreen()
            );
          },
          label:  Text("Go To All Employees Screen",
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15,
                color: Colors.amber.shade700
            ),
          ),),
      );
  }

  _onTap(){
    if( _nameController.text.isNotEmpty &&  _nameController.text != "" &&
        _yearController.text != "")
    {
      Map<String,dynamic> data = {
        "name": _nameController.text.toString(),
        "years": _yearController.text.toString(),
        "active": isActive ?? false
      };
      ref.push().set(data);
      _nameController.clear();
      _yearController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
          snackBar(
              msg: 'Upload Successful',
              color: Colors.green
          ));

    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(
          snackBar(
              msg: 'Please Fill the Form'
          ));
    }
  }
}
