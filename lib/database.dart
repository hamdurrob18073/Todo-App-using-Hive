import 'package:hive_flutter/hive_flutter.dart';

class TododataBase{
  List TodiList=[];

  final _mybox =Hive.box('mybox');
  void loadData (){
    TodiList = _mybox.get("TODOLIST");


  }
  void updatedatabase(){
    _mybox.put("TODOLIST", TodiList);

  }
}