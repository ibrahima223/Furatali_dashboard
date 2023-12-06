class Rappel{
  final String imageUrl, title, dose, heure, userName;

  Rappel({required this.userName, required this.imageUrl, required this.title, required this.dose, required this.heure});

  factory Rappel.fromMap(Map<String, dynamic> data) {
    return Rappel(
      userName: data['userName'] as String,
      imageUrl: data['imageUrl'] as String,
      title: data['title'] as String,
      dose: data['dose'] as String,
      heure: data['heure'] as String,
    );
  }

}
List rappels =[
  Rappel(
      userName: 'Blonkon',
      imageUrl: 'assets/images/profile1.jpg',
      title: "Aspirine",
      dose: "50 mg",
      heure: "10: 00"
  ),
  Rappel(
      userName: 'Fadiga',
      imageUrl: 'assets/images/profile1.jpg',
      title: "Aspirine",
      dose: "50 mg",
      heure: "10: 00"
  ),
  Rappel(
      userName: 'Touré',
      imageUrl: 'assets/images/profile1.jpg',
      title: "Aspirine",
      dose: "50 mg",
      heure: "10: 00"
  ),
  Rappel(
      userName: 'Guindo',
      imageUrl: 'assets/images/profile1.jpg',
      title: "Aspirine",
      dose: "50 mg",
      heure: "10: 00"
  ),
  Rappel(
      userName: 'Maiga',
      imageUrl: 'assets/images/profile1.jpg',
      title: "Aspirine",
      dose: "50 mg",
      heure: "10: 00"
  ),
  Rappel(
      userName: 'Sy Diakaridia',
      imageUrl: 'assets/images/profile1.jpg',
      title: "Aspirine",
      dose: "50 mg",
      heure: "10: 00"
  ),
  Rappel(
      userName: 'Togo',
      imageUrl: 'assets/images/profile1.jpg',
      title: "Aspirine",
      dose: "50 mg",
      heure: "10: 00"
  )

];