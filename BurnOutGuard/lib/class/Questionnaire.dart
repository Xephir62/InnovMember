class Questionnaire {
  final int id;
  final String cleprive;
  final String datedebut;
  final String datefin;
  final int analyse;

  const Questionnaire({
    required this.id,
    required this.cleprive,
    required this.datedebut,
    required this.datefin,
    required this.analyse
  });

  factory Questionnaire.fromJson(Map<String, dynamic> json) {
    return Questionnaire(
        id: json['id'],
        cleprive: json['cleprive'],
        datedebut: json['datedebut'],
        datefin: json['datefin'],
        analyse: json['analyse']
    );
  }
}