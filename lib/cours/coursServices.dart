import 'package:dio/dio.dart';

class CoursServices {
  Dio dio = Dio();
  List<Cours> courssss = [];

  Future<List<Cours>?> fetchcours(int digiref, List courss) async {
    try {
      Response response = await dio.get(
        "http://51.38.199.214:2036/mobile/homeWork/course/$digiref",
      );
      print(response.data);
      for (int i = 0; i < response.data.length; i++) {
        courss.add(Cours.fromJson(response.data[i]));
      }
      print(courss);
      return courssss;
    } on DioError catch (e) {
      print(e);
    }
  }
}

class Cours {
  int? id;
  String? frName;
  String? arname;

  Cours({this.id, this.frName, this.arname});

  Cours.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    frName = json['frName'];
    arname = json['arname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['frName'] = this.frName;
    data['arname'] = this.arname;
    return data;
  }
}
