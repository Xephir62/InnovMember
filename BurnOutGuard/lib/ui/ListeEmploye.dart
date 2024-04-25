import 'package:burnoutguard/back/BackEmploye.dart';
import 'package:burnoutguard/class/employe_data.dart';
import 'package:burnoutguard/ui/AjouterEmploye.dart';
import 'package:burnoutguard/ui/ListeQuestionnaireEmploye.dart';
import 'package:burnoutguard/ui/ModifierEmploye.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../class/Employe.dart';
import 'MenuPrincipal.dart';

class Listemploye extends StatefulWidget {
  const Listemploye({Key? key}) : super(key: key);

  @override
  State<Listemploye> createState() => _ListemployeState();
}

class _ListemployeState extends State<Listemploye> {
  bool _chargementTermine = false;
  List<Employe> _allemploye = [];

  @override
  void initState() {
    super.initState();
    _initialiser();
  }

  Future<void> _initialiser() async {
    _allemploye = employeData.buildList(await fetchAllEmploye());
    setState(() {
      _chargementTermine = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _chargementTermine ?Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3a57e8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Employés",
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
                MaterialPageRoute(builder: (context) => MenuPrincipal()));
          },
          padding: EdgeInsets.all(6),
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xffffffff),
            size: 22,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AjouterEmploye()));
              },
              padding: EdgeInsets.all(6),
              child: Icon(
                Icons.add,
                color: Color(0xffffffff),
                size: 22,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _allemploye.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child:  Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _allemploye[index].nom,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: Color(0xff3a57e8),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.menu),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ListeQuestionnaireEmploye(idemploye: _allemploye[index].id)));
                              },
                              color: Color(0xff212435),
                              iconSize: 24,
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ModifierEmploye(employe: _allemploye[index])));
                              },
                              color: Color(0xff212435),
                              iconSize: 24,
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                await removeEmploye(_allemploye[index].id);
                                Alert(
                                  context: context,
                                  type: AlertType.success,
                                  title: "L'employé a bien été supprimé",
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
                              color: Color(0xff212435),
                              iconSize: 24,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

      )
    ): Center(
    child: CircularProgressIndicator(),
    );
  }
}
