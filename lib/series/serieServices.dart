import 'package:dio/dio.dart';
import 'package:rafe9ni/tmp/Qcm/QCXModel.dart';

import '../tmp/Darg&drop_image/dargAndDropModel.dart';

class SeriesServices {
  Dio dio = Dio();
  List<Series> seriess = [];
  List<TypeExercies> typess = [];
  Future<List<Series>?> fetchSeries(
      int batchid, int idstudent, int courseid, List series) async {
    try {
      Response response = await dio.get(
        "http://51.38.199.214:2036/mobile/rafi9niplus/serie/$batchid/$idstudent/$courseid/1/5",
      );
      if (series.isEmpty == true) {
        for (int i = 0; i < response.data.length; i++) {
          series.add(Series.fromJson(response.data[i]));
        }
      }
      return seriess;
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<List<TypeExercies>?> fetchExercices(int idSeie, List typesEx) async {
    try {
      Response response =
          await dio.get('http://51.38.199.214:2036/mobile/type/exercice/8639');
      if (typesEx.isEmpty == true) {
        for (int i = 0; i < response.data.length; i++) {
          typesEx.add(TypeExercies.fromJson(response.data[i]));
        }
      }
      print(response.data);
      return typess;
    } on DioError catch (e) {
      print(e);
    }
  }

  List<ItemModel> exercices = [];
  Future<List<ItemModel>?> fetchExercicess(
      int idEx, int idSerie, List contentOfEx) async {
    try {
      Response response = await dio
          .get("http://51.38.199.214:2036/mobile/exercice/details/69/8639");
      print(response.data);
      if (contentOfEx.isEmpty == true) {
        for (int i = 0; i < response.data['itemModel'].length; i++) {
          contentOfEx.add(ItemModel.fromJson(response.data['itemModel'][i]));
        }
      }

      return exercices;
    } on DioError catch (e) {
      print(e);
    }
  }

  List<QCX> qcu = [];
  Future<List<QCX>?> fetchaqcu(int idEx, int idSerie, List contentOfqcu) async {
    try {
      Response response = await dio
          .get("http://51.38.199.214:2036/mobile/exercice/detailsqcm/70/8639");
      print(response.data);
      if (contentOfqcu.isEmpty == true) {
        for (int i = 0; i < response.data['propsQCX'].length; i++) {
          contentOfqcu.add(QCX.fromJson(response.data['propsQCX'][i]));
        }
      }
      print('**************************');
      print(contentOfqcu);
      print('**************************');
      return qcu;
    } on DioError catch (e) {
      print(e);
    }
  }
}

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
