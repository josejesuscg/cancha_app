class Reservation {
  int? id;
  String? nameUser;
  String? nameCourt;
  DateTime? date;
  String? address = 'Av Diego Bautista Urbaneja';
  String? weather;
  String? weatherIcon;
  String? imgCourt;
  Reservation({this.id, this.nameUser, this.nameCourt, this.date, this.weather, this.weatherIcon, this.imgCourt, this.address});

  Reservation.fromJson(Map<String,dynamic> jsonMap){
    id = jsonMap ['id'];
    nameUser = jsonMap ['nameUser'];
    nameCourt = jsonMap ['nameCourt'];
    date = DateTime.parse(jsonMap['date'] ?? '');
    address = jsonMap['address'];
    weather = jsonMap['weather'];
    weatherIcon = jsonMap['weatherPorc'];
    imgCourt = jsonMap["imgCourt"];
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'nameUser' : nameUser,
      'nameCourt' : nameCourt,
      'date' : date.toString(),
      'address' : address,
      'weather' : weather,
      // 'weatherPorc' : weatherIcon,
      'imgCourt' : imgCourt
    };
  }
}

