import 'package:flutter/material.dart';

Future nav({
required BuildContext context,
required Widget widget
}){
  return  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>widget));
}