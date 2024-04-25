import 'package:burnoutguard/ui/ListeEmploye.dart';
import 'package:burnoutguard/ui/ListeQuestionnaire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({Key? key}) : super(key: key);

  @override
  State<MenuPrincipal> createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Menu Principal",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xffffffff),
          ),
        ),
        actions: [
          Icon(Icons.logout, color: Color(0xffff0004), size: 24),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 12, 0, 16),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.article,
                          color: Color(0xff3a57e8),
                          size: 50,
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Listequestionnaire()));
                                        },
                                        color: Color(0xff3a58eb),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                          side: BorderSide(
                                              color: Color(0xff808080),
                                              width: 1),
                                        ),
                                        padding: EdgeInsets.all(6),
                                        child: Text(
                                          "Questionnaire",
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.article,
                          color: Color(0xff3a57e8),
                          size: 50,
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Listemploye()));
                                        },
                                        color: Color(0xff3a58eb),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                          side: BorderSide(
                                              color: Color(0xff808080),
                                              width: 1),
                                        ),
                                        padding: EdgeInsets.all(6),
                                        child: Text(
                                          "Employé",
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
