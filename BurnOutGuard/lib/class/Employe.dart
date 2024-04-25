class Employe {
  final int id;
  final String nom;
  final String email;
  final int service;
  final String cleprive;

  const Employe({
    required this.id,
    required this.nom,
    required this.email,
    required this.service,
    required this.cleprive
  });

  factory Employe.fromJson(Map<String, dynamic> json) {
    return Employe(
        id: json['id'],
        nom: json['nom'],
        email: json['email'],
        service: json['service'],
        cleprive: json['cleprive']
    );
  }
}