import 'package:meta/meta.dart';
import 'dart:convert';

Level levelFromJson(String str) => Level.fromJson(json.decode(str));

String levelToJson(Level data) => json.encode(data.toJson());

class Level {
  Level({
    required this.erreur,
    required this.students,
  });

  String erreur;
  List<Student> students;

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        erreur: json["erreur"],
        students: List<Student>.from(
            json["students"].map((x) => Student.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "erreur": erreur,
        "students": List<dynamic>.from(students.map((x) => x.toJson())),
      };
}

class Student {
  Student({
    required this.idStudent,
    required this.idUserStudent,
    required this.idGrade,
    required this.idBatch,
    required this.nameBatch,
    required this.digiref,
  });

  int idStudent;
  int idUserStudent;
  int idGrade;
  int idBatch;
  String nameBatch;
  int digiref;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        idStudent: json["idStudent"],
        idUserStudent: json["idUserStudent"],
        idGrade: json["idGrade"],
        idBatch: json["idBatch"],
        nameBatch: json["nameBatch"],
        digiref: json["digiref"],
      );

  Map<String, dynamic> toJson() => {
        "idStudent": idStudent,
        "idUserStudent": idUserStudent,
        "idGrade": idGrade,
        "idBatch": idBatch,
        "nameBatch": nameBatch,
        "digiref": digiref,
      };
}
