import 'dart:ui';

import 'package:burnoutguard/back/BackEmploye.dart';
import 'package:burnoutguard/ui/ListeEmploye.dart';
import 'package:burnoutguard/ui/ListeQuestionnaire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../back/BackQuestionnaire.dart';
import 'MenuPrincipal.dart';

class NouveauQuestionnaire extends StatefulWidget {
  const NouveauQuestionnaire({Key? key}) : super(key: key);

  @override
  State<NouveauQuestionnaire> createState() => _NouveauQuestionnaireState();
}

class _NouveauQuestionnaireState extends State<NouveauQuestionnaire> {
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
          "Nouveau Questionnaire",
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
                MaterialPageRoute(builder: (context) => Listequestionnaire()));
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
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
                      future: BackNouveauQuestionnaire(
                          context
                      ),
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
                      title: "Le questionnaire a bien été envoyé.",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Fermer",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Listequestionnaire())),
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
                    "Envoyer",
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
