import 'dart:convert';
import 'dart:io';
import 'package:burnoutguard/ui/MenuPrincipal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../class/User.dart';


Future<void> fetchUser(BuildContext context, String email, String password) async {
  FlutterSecureStorage storage = FlutterSecureStorage();
  final response = await http.post(Uri.parse('http://localhost:8000/app.php'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
      'Accept': '*/*'
    },
    body: jsonEncode(<String, String>{
      'method': "login",
      'email': email,
      'password': password
    }),);
  await storage.deleteAll();
  if (response.statusCode == 200) {
    User u = User.fromJson(jsonDecode(response.body));
    await storage.write(key: "log", value: "true");
    await storage.write(key: "email", value: u.email);
    await storage.write(key: "id", value: u.id.toString());
    Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPrincipal()));
  }else{
    await storage.write(key: "log", value: "false");
  }
}