import 'package:flutter/material.dart';

import 'button.dart';
class diolog extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCalcel;
  final controller;
   diolog({super.key,
     required this.controller,
     required this.onSave,
     required this.onCalcel

   }) ;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(height: 120,
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(border: OutlineInputBorder(),
          hintText: 'Add a new task'),

        ),
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Mybutton(text: "Save", onPressed: onSave),
            SizedBox(width: 8,),
            Mybutton(text: "Cancel", onPressed: onCalcel),
          ],
        )
      ],),
      ),
    );
  }
}
