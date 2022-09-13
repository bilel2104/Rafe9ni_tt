class Series {
  int? id;
  String? matiere;
  String? creationDate;
  String? color;

  Series({this.id, this.matiere, this.creationDate, this.color});

  Series.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matiere = json['matiere'];
    creationDate = json['creationDate'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['matiere'] = this.matiere;
    data['creationDate'] = this.creationDate;
    data['color'] = this.color;
    return data;
  }
}

class TypeExercies {
  int? idExercice;
  String? enonce;
  String? type;

  TypeExercies({this.idExercice, this.enonce, this.type});

  TypeExercies.fromJson(Map<String, dynamic> json) {
    idExercice = json['idExercice'];
    enonce = json['enonce'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idExercice'] = this.idExercice;
    data['enonce'] = this.enonce;
    data['type'] = this.type;
    return data;
  }
}
