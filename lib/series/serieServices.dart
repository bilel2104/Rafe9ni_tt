import 'package:dio/dio.dart';

class SeriesServices {
  Dio dio = Dio();
  List<Series> seriess = [];
  Future<List<Series>?> fetchSeries(
      int batchid, int idstudent, int courseid, List series) async {
    try {
      Response response = await dio.get(
        "http://51.38.199.214:2036/mobile/rafi9niplus/serie/$batchid/$idstudent/$courseid/1/5",
      );

      for (int i = 0; i < response.data.length; i++) {
        series.add(Series.fromJson(response.data[i]));
      }
      print('-------------');
      print(series);
      print('*****************');
      print(seriess);
      return seriess;
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
