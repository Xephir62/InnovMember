import 'package:burnoutguard/ui/ListeEmploye.dart';
import 'package:burnoutguard/ui/ModifierEmail.dart';
import 'package:burnoutguard/ui/ModifierNom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../class/Employe.dart';
import 'MenuPrincipal.dart';

class ModifierEmploye extends StatefulWidget {
  final employe;

  const ModifierEmploye({Key? key, required this.employe}) : super(key: key);

  @override
  State<ModifierEmploye> createState() => _ModifierEmployeState();
}

class _ModifierEmployeState extends State<ModifierEmploye> {
  late Employe _employe;
  bool _chargementTermine = false;

  @override
  void initState() {
    super.initState();
    _initialiser();
  }

  Future<void> _initialiser() async {
    _employe = widget.employe;
    setState(() {
      _chargementTermine = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return _chargementTermine ? Scaffold(
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
          "Modifier Employé",
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
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(16),
        shrinkWrap: false,
        physics: ScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Nom Prénom",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                  child: Text(
                    _employe.nom,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      color: Color(0xff9e9e9e),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ModifierNom(idemploye: _employe.id)));
                  },
                  padding: EdgeInsets.all(6),
                  child: Icon(
                    Icons.edit,
                    color: Color(0xff000000),
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Color(0x4d9e9e9e),
            height: 16,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Email",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                  child: Text(
                    _employe.email,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                      color: Color(0xff9e9e9e),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ModifierEmail(idemploye: _employe.id)));
                  },
                  padding: EdgeInsets.all(6),
                  child: Icon(
                    Icons.edit,
                    color: Color(0xff000000),
                    size: 18,
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    ): Center(
      child: CircularProgressIndicator(),
    );
  }
}
