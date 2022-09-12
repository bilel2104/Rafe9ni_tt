class QCX {
  int? idExercice;
  String? enonce;
  List<PropsQCX>? props;

  QCX({this.idExercice, this.enonce, this.props});

  QCX.fromJson(Map<String, dynamic> json) {
    idExercice = json['idExercice'];
    enonce = json['enonce'];
    if (json['propsQCX'] != null) {
      props = <PropsQCX>[];
      json['propsQCX'].forEach((v) {
        props!.add(new PropsQCX.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idExercice'] = this.idExercice;
    data['enonce'] = this.enonce;
    if (this.props != null) {
      data['propsQCX'] = this.props!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PropsQCX {
  String? label;
  bool? value;

  PropsQCX({this.label, this.value});

  PropsQCX.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['value'] = this.value;
    return data;
  }
}
