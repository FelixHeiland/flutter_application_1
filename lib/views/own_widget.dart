import 'package:flutter/material.dart';

class OwnWidget extends StatelessWidget{
  final String? xAndOs; 
const OwnWidget({super.key, this.xAndOs});
@override
  Widget build(BuildContext context) {
return Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    padding: const EdgeInsets.all(45),
    decoration: const BoxDecoration(
      color: Colors.green
    ),
    child: Center(child: Text(xAndOs == null ?'':xAndOs!,style: TextStyle(fontWeight: FontWeight.bold),),),
  ),
);
  }
}