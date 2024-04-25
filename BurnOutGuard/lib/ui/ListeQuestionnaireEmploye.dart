import 'package:burnoutguard/class/questionnare_data.dart';
import 'package:burnoutguard/ui/CompteRendu.dart';
import 'package:burnoutguard/ui/MenuPrincipal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:intl/intl.dart';

import '../back/BackQuestionnaire.dart';
import '../class/Questionnaire.dart';
import 'ListeEmploye.dart';
import 'ListeQuestionnaire.dart';
import 'NouveauQuestionnaire.dart';

class ListeQuestionnaireEmploye extends StatefulWidget {
  final idemploye;
  const ListeQuestionnaireEmploye({Key? key, required this.idemploye}) : super(key: key);

  @override
  State<ListeQuestionnaireEmploye> createState() => _ListeQuestionnaireEmployeState();
}

class _ListeQuestionnaireEmployeState extends State<ListeQuestionnaireEmploye> {
  bool _chargementTermine = false;
  List<Questionnaire> _allquestionnaire = [];
  late int _idemploye;


  @override
  void initState() {
    super.initState();
    _initialiser();
  }

  Future<void> _initialiser() async {
    _idemploye = widget.idemploye;
    _allquestionnaire = questionnaireData.buildList(await fetchQuestionnaireEmploye(_idemploye));
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
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3a57e8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Questionnaire",
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
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NouveauQuestionnaire()));
              },
              padding: EdgeInsets.all(6),
            ),
          ),
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                child: Text(
                  "Du plus récent au plus ancien",
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



              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _allquestionnaire.length,
                  itemBuilder: (context, index) {
                    DateTime dateDebut = DateTime.parse(_allquestionnaire[index].datedebut);
                    DateTime dateFin = DateTime.parse(_allquestionnaire[index].datefin);

                    // Formatez les dates en utilisant DateFormat
                    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
                    String formattedDateDebut = dateFormat.format(dateDebut);


                    return Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child:  Container(
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  "Questionnaire du " + formattedDateDebut,
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.clip,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 16,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
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
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => CompteRendu(idemploye: _idemploye, idquestionnaire: _allquestionnaire[index].id)));
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
                                              "Compte Rendu",
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
                    );
                  }

              )
            ],
          ),
        ),
      ),
    ): Center(
      child: CircularProgressIndicator(),
    );
  }
}
