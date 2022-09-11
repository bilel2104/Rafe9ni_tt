import 'package:dio/dio.dart';
import 'package:rafe9ni/home/levelModel.dart';

class LevelServices {
  Dio dio = Dio();
  List<Student> level = [];

  Future<List<Student>?> fetchlevel(int idGardian, List le) async {
    try {
      Response response = await dio.get(
        "http://51.38.199.214:2036/mobile/rafi9niplus/students/2203",
      );

      print(response.data['students']);
      for (int i = 0; i < response.data['students'].length; i++) {
        le.add(Student.fromJson(response.data['students'][i]));
      }
      print(level);
      return level;
    } on DioError catch (e) {
      print(e);
    }
  }
}
