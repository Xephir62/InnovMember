import 'dart:convert';

import 'package:burnoutguard/class/Questionnaire.dart';


class questionnaireData{
  static List<Questionnaire> buildList(String jsondata){
    List<Questionnaire> list = [];
    var jsonDecode = json.decode(jsondata) as List<dynamic>;
    list = jsonDecode.map((element) => Questionnaire.fromJson(element)).toList();
    return list;
  }
}