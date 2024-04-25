import 'dart:convert';

import 'package:burnoutguard/class/Analyse.dart';
import 'package:burnoutguard/class/Employe.dart';


class analyseData{
  static List<Analyse> buildList(String jsondata){
    List<Analyse> list = [];
    var jsonDecode = json.decode(jsondata) as List<dynamic>;
    list = jsonDecode.map((element) => Analyse.fromJson(element)).toList();
    return list;
  }
}