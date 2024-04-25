class Analyse {
  final int id;
  final String compterendu;
  final String conseil;
  final String risque;

  const Analyse({
    required this.id,
    required this.compterendu,
    required this.conseil,
    required this.risque
  });

  factory Analyse.fromJson(Map<String, dynamic> json) {
    return Analyse(
        id: json['id'],
        compterendu: json['compterendu'],
        conseil: json['conseil'],
        risque: json['risque']
    );
  }
}