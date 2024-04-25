import 'package:burnoutguard/class/analyse_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../back/BackAnalyse.dart';
import '../class/Analyse.dart';

class CompteRendu extends StatefulWidget {
  final idemploye;
  final idquestionnaire;

  const CompteRendu(
      {Key? key, required this.idemploye, required this.idquestionnaire})
      : super(key: key);

  @override
  State<CompteRendu> createState() => _CompteRenduState();
}

class _CompteRenduState extends State<CompteRendu> {
  List<Analyse> _analyse = [];
  late int _idemploye;
  late int _idquestionnaire;
  bool _chargementTermine = false;

  @override
  void initState() {
    super.initState();
    _initialiser();
  }

  Future<void> _initialiser() async {
    _idemploye = widget.idemploye;
    _idquestionnaire = widget.idquestionnaire;
    _analyse = analyseData
        .buildList(await fetchCompteRendu(_idemploye, _idquestionnaire));
    setState(() {
      _chargementTermine = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _chargementTermine
        ? Scaffold(
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
    "Compte Rendu",
    style: TextStyle(
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 20,
      color: Color(0xffffffff),
    ),
  ),
  leading: IconButton(
    icon: Icon(
      Icons.arrow_back_ios,
      color: Color(0xffffffff),
      size: 50,
    ),
    onPressed: () {
      Navigator.pop(context); 
    },
  ),
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
                          margin:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(12.0),
                            border:
                                Border.all(color: Color(0x4d9e9e9e), width: 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              16, 0, 0, 0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        "Analyse des réponses",
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.clip,
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                          fontStyle:
                                                                              FontStyle.normal,
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Color(0xff000000),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                    0, 4, 0, 0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0),
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              4,
                                                                          horizontal:
                                                                              8),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x341dff00),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerRight,
                                                                    child: Text(
                                                                      "Complété",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .clip,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        fontSize:
                                                                            12,
                                                                        color: Color(
                                                                            0xff075b02),
                                                                      ),
                                                                    ),
                                                                  ),
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
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 16, 0, 0),
                                                child: Text(
                                                  "Risque de burn out :",
                                                  textAlign: TextAlign.start,
                                                  overflow: TextOverflow.clip,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    5, 16, 0, 0),
                                                child: Text(
                                                    _analyse[0].risque,
                                                  textAlign: TextAlign.start,
                                                  overflow: TextOverflow.clip,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 18,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 16, 0, 0),
                                        child: Text(
                                          _analyse[0].compterendu,
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                                    child: Text(
                                      "Conseil",
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                                child: Text(
                                  _analyse[0].conseil,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    color: Color(0xff000000),
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
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
