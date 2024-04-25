import 'dart:convert';

import 'package:burnoutguard/class/Employe.dart';


class employeData{
  static List<Employe> buildList(String jsondata){
    List<Employe> list = [];
    var jsonDecode = json.decode(jsondata) as List<dynamic>;
    list = jsonDecode.map((element) => Employe.fromJson(element)).toList();
    return list;
  }
}