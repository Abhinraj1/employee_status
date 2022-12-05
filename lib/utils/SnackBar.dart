import 'package:flutter/material.dart';

SnackBar snackBar({required String msg, Color? color}){
  return
     SnackBar(
      content: Text(msg,
       style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 15,
            color: Colors.white
        ),),
      backgroundColor: color?? Colors.redAccent,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(5),
    );
}