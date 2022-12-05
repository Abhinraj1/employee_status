import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
 final String hint;
 final TextEditingController controller;
 final bool? isNumber;
  const CustomTextField({Key? key,
    this.isNumber ,
  required this.hint,
  required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.grey,
        keyboardType: isNumber ?? false ? TextInputType.number : TextInputType.name,
        decoration:  InputDecoration(
          fillColor: Colors.white,
            filled: true,
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none
            ),
            hintText: hint.toString(),
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w800,
            ),
            border:const  OutlineInputBorder(
                borderSide: BorderSide.none
            )
        ),

      ),
    );
  }
}
