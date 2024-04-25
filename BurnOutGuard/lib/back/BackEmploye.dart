import 'dart:convert';
import 'dart:io';
import 'package:burnoutguard/ui/MenuPrincipal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../class/User.dart';


Future<void> addEmploye(BuildContext context, String nom, String email, String service) async {
  FlutterSecureStorage storage = FlutterSecureStorage();
  final response = await http.post(Uri.parse('http://localhost:8000/app.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*'
    },
    body: jsonEncode(<String, String>{
      'method': "ajouteremploye",
      'nom': nom,
      'email': email,
      'service': service
    }),
  );
}

Future<String> fetchAllEmploye() async {
  final response = await http.post(Uri.parse('http://localhost:8000/app.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*'
    },
    body: jsonEncode(<String, String>{
      'method': "fetchallemploye"
    }),
  );
  if (response.statusCode == 200) {
    return response.body;
  }else{
    throw Exception('Failed to load album');
  }
}

Future<void> removeEmploye(int idemploye) async {
  final response = await http.post(Uri.parse('http://localhost:8000/app.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*'
    },
    body: jsonEncode(<String, String>{
      'method': "removeemploye",
      'id': idemploye.toString()
    }),
  );
}

Future<void> updateEmail(int idemploye, String email) async {
  final response = await http.post(Uri.parse('http://localhost:8000/app.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*'
    },
    body: jsonEncode(<String, String>{
      'method': "updateemail",
      'id': idemploye.toString(),
      'email': email.toString(),
    }),
  );
}

Future<void> updateNom(int idemploye, String nom) async {
  final response = await http.post(Uri.parse('http://localhost:8000/app.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*'
    },
    body: jsonEncode(<String, String>{
      'method': "updatenom",
      'id': idemploye.toString(),
      'nom': nom.toString(),
    }),
  );
}