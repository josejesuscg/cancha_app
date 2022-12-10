

class Court {
  int? id;
  String? name;
  String? imgCancha;
  String? address;

  Court(
      {required this.id,
      required this.name,
      required this.imgCancha,
      required this.address});

  Court.fromJson(Map<String, dynamic> jsonMap) {
    id = jsonMap['id'];
    name = jsonMap['name'];
    imgCancha = jsonMap['imgCancha'];
    address = jsonMap['address'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'name' : name,
      'imgCancha' : imgCancha,
      'address' : address
    };
  }
}
