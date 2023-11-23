// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

import 'dart:convert';

import 'package:practice_yesno/domain/entities/messages.dart';

YesNoModel yesNoModelFromJson(String str) => YesNoModel.fromJsonMap(json.decode(str));

String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson());

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );
    //Este metodo aún no lo usamos.
    Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };
    //!Estamos creando este mapper para regresar un mensaje
    Message toMessage() => Message(
      text: answer == 'yes' ? 'si' : 'no', 
      fromQuo: FromQuo.hers,
      imageUrl: image,
      );
}

























/* class YesNoModel{
  String answer;
  bool forced;
  String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image
  });

  factory YesNoModel.fromJson( Map<String, dynamic> json ) => 
  YesNoModel(
    answer: json['answer'], 
    forced: json['forced'], 
    image: json['image'],
  );
} */