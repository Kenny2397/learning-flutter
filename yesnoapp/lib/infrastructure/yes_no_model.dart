import 'package:yesnoapp/domain/entities/message.dart';

class YessNoModel {
  final String image;
  final String answer;
  final bool forced;

  YessNoModel({
    required this.image,
    required this.answer,
    required this.forced,
  });

  factory YessNoModel.fromJsonMap(Map<String, dynamic> json) {
    return YessNoModel(
      image: json['image'],
      answer: json['answer'],
      forced: json['forced'],
    );
  }

  Message toMessageEntity() {
    return Message(
      text: answer == 'yes' ? 'Si' : 'No',
      fromWho: FromWho.your,
      imageUrl: image,
    );
  }
}
