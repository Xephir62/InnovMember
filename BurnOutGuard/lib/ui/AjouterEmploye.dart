import 'dart:ui';

import 'package:burnoutguard/back/BackEmploye.dart';
import 'package:burnoutguard/ui/ListeEmploye.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'MenuPrincipal.dart';

TextEditingController emailController = TextEditingController();
TextEditingController nomController = TextEditingController();

class AjouterEmploye extends StatefulWidget {
  const AjouterEmploye({Key? key}) : super(key: key);

  @override
  State<AjouterEmploye> createState() => _AjouterEmployeState();
}

class _AjouterEmployeState extends State<AjouterEmploye> {
  String? selectedValue;

  Map<String, int> dropdownValues = {
    "Informatique": 1,
    "RH": 2,
    "Logistique": 3,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3a57e8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Ajouter Employé",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xffffffff),
          ),
        ),
        leading: MaterialButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Listemploye()));
          },
          padding: EdgeInsets.all(6),
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xffffffff),
            size: 22,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: TextField(
                  controller: nomController,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                          BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                          BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                          BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    labelText: "Nom et prénom",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xff9e9e9e),
                    ),
                    hintText: "",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff9e9e9e),
                    ),
                    filled: true,
                    fillColor: Color(0x00ffffff),
                    isDense: false,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: TextField(
                  controller: emailController,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xff000000),
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                          BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                          BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                          BorderSide(color: Color(0xff9e9e9e), width: 1),
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xff9e9e9e),
                    ),
                    hintText: "",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff9e9e9e),
                    ),
                    filled: true,
                    fillColor: Color(0x00ffffff),
                    isDense: false,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Container(
                    width: 250,
                    height: 50,
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedValue,
                        items: dropdownValues.keys
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue;
                          });
                        },
                        elevation: 8,
                        isExpanded: true,
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: MaterialButton(
                  onPressed: () {
                    FutureBuilder<void>(
                      future: addEmploye(
                          context,
                          nomController.text.toString(),
                          emailController.text.toString(),
                          dropdownValues[selectedValue].toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Afficher un rond de chargement si la requête est en cours
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          // Afficher un message d'erreur si la requête a échoué
                          return Text("Erreur : ${snapshot.error}");
                        } else {
                          return Text("OK");
                        }
                      },
                    );
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: "L'employé a été ajouté avec succès.",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Fermer",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Listemploye())),
                          width: 120,
                        )
                      ],
                    ).show();
                  },
                  color: Color(0xff3956e6),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(color: Color(0xff808080), width: 1),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Ajouter",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  textColor: Color(0xffffffff),
                  height: 40,
                  minWidth: 140,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
