import 'dart:convert';
import 'dart:io';
import 'package:burnoutguard/ui/MenuPrincipal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../class/User.dart';

Future<String> fetchCompteRendu(int idemploye, int idquestionnaire) async {
  final response = await http.post(Uri.parse('http://localhost:8000/app.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*'
    },
    body: jsonEncode(<String, String>{
      'method': "fetchcompterendu",
      'idemploye': idemploye.toString(),
      'idquestionnaire': idquestionnaire.toString()
    }),
  );
  if (response.statusCode == 200) {
    return response.body;
  }else{
    throw Exception('Failed to load album');
  }
}
