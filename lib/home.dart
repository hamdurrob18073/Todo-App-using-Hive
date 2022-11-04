import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/database.dart';
import 'package:todo/todo.dart';

import 'diolog.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _mybox =Hive.box('mybox');
  TododataBase db=TododataBase();
  @override
  void initState() {
   if (_mybox.get("TODOLIST")==null){}else{db.loadData();}
    super.initState();
  }

  final _controller =TextEditingController();

  void checkBoxChange (bool? value, int index) {
    setState(() {
      db.TodiList[index][1]=!db.TodiList[index][1];
      db.updatedatabase();
    });
  }
  void savenewtask (){
    setState(() {
      db.TodiList.add([_controller.text,false]);
      _controller.clear();
      db.updatedatabase();
    });
    Navigator.of(context).pop();
  }
  void delettask(int index){
    db.TodiList.removeAt(index);
    db.updatedatabase();

  }
  void createnewtask(){
    showDialog(context: context, builder: (context){
      return diolog(controller:_controller ,onSave: savenewtask,onCalcel: ()=> Navigator.of(context).pop(),);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFEEEFF5),
        title: Row(
          children: [
            Icon(
              Icons.menu,
              color: Color(0xFF3A3A3A),
              size: 30,
            ),
            SizedBox(width: 70),
            Text(
              "Today's Work",
              style: TextStyle(color: Color(0xFF3A3A3A), fontSize: 25),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: createnewtask,child: Icon(Icons.add),),
      body:ListView.builder(itemCount: db.TodiList.length,itemBuilder: (context,index){
        return todo(taskName: db.TodiList[index][0],  taskComplited:db.TodiList[index][1],onChanged:(value)=>checkBoxChange(value,index) ,delet: (context)=>delettask(index), );
    },)
    );
  }
}
