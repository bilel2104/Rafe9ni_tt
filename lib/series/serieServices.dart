import 'package:dio/dio.dart';
import 'package:rafe9ni/series/seriesModel.dart';
import 'package:rafe9ni/tmp/QCU/QCXModel.dart';

import '../tmp/Darg&drop_image/dargAndDropModel.dart';

class SeriesServices {
  Dio dio = Dio();
  List<Series> seriess = [];
  List<TypeExercies> typess = [];

  Future<List<Series>?> fetchSeries(
      //this function will fetch the series from the api
      int batchid,
      int idstudent,
      int courseid,
      List series) async {
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

  Future<List<TypeExercies>?> fetchEx(int idSeie, List typesEx) async {
    //this function will fetch the types of the exercises from the api
    try {
      Response response = await dio
          .get('http://51.38.199.214:2036/mobile/type/exercice/$idSeie');
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
  Future<List<ItemModel>?> fetchExDrag(
      int idEx, int idSerie, List contentOfEx) async {
    //  this function will fetch the content of the exercise Drag and drop from the api
    try {
      Response response = await dio.get(
          "http://51.38.199.214:2036/mobile/exercice/details/$idEx/$idSerie");

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

  QCX qcxs = QCX();
  List<PropsQCX> qcxsList = [];
  Future<List<PropsQCX>?> fetchaqcu(
      int idEx, int idSerie, List contentOfqcu) async {
    //  this function will fetch the content of the exercise qcu from the api
    try {
      Response response = await dio.get(
          "http://51.38.199.214:2036/mobile/exercice/detailsqcm/$idEx/$idSerie");
      if (contentOfqcu.isEmpty == true) {
        for (int i = 0; i < response.data['propsQCX'].length; i++) {
          contentOfqcu.add(PropsQCX.fromJson(response.data['propsQCX'][i]));
        }
      }

      return qcxsList;
    } on DioError catch (e) {
      print(e);
    }
  }
}
