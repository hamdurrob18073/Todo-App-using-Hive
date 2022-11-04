import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class todo extends StatelessWidget {
  final String taskName;
  final bool taskComplited;
  Function(bool?)? onChanged;
  Function(BuildContext)? delet;


  todo(
      {required this.taskName,
      required this.onChanged,
      required this.taskComplited,
      required this.delet
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 25, right: 25, top: 25),
        child: Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(onPressed: delet,
              icon: Icons.delete,backgroundColor: Colors.red,borderRadius: BorderRadius.circular(12),),
              
            ],
          ),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Checkbox(
                    value: taskComplited,
                    onChanged: onChanged,
                    activeColor: Colors.black,
                  ),
                  Text(
                    taskName,
                    style: TextStyle(
                        decoration: taskComplited
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
          ),
        ));
  }
}
