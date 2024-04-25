import 'dart:convert';
import 'dart:io';
import 'package:burnoutguard/ui/MenuPrincipal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../class/User.dart';


Future<void> BackNouveauQuestionnaire(BuildContext context) async {
  final response = await http.post(Uri.parse('http://localhost:8000/app.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*'
    },
    body: jsonEncode(<String, String>{
      'method': "nouveauquestionnaire",
    }),
  );
  if (response.statusCode == 200) {
  }
}

Future<String> fetchAllQuestionnaire() async {
  final response = await http.post(Uri.parse('http://localhost:8000/app.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*'
    },
    body: jsonEncode(<String, String>{
      'method': "fetchallquestionnaire"
    }),
  );
  if (response.statusCode == 200) {
    return response.body;
  }else{
    throw Exception('Failed to load album');
  }
}

Future<String> analyseQuestionnaire(String cleprive) async {
  final response = await http.post(Uri.parse('http://localhost:8000/app.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*'
    },
    body: jsonEncode(<String, String>{
      'method': "analyseQuestionnaire",
      'cleprive': cleprive
    }),
  );
  if (response.statusCode == 200) {
    return response.body;
  }else{
    throw Exception('Failed to load album');
  }
}

Future<String> fetchQuestionnaireEmploye(int idemploye) async {
  final response = await http.post(Uri.parse('http://localhost:8000/app.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*'
    },
    body: jsonEncode(<String, String>{
      'method': "fetchquestionnaireemploye",
      'idemploye': idemploye.toString()
    }),
  );
  if (response.statusCode == 200) {
    return response.body;
  }else{
    throw Exception('Failed to load album');
  }
}