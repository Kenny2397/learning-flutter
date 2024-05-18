import 'package:dio/dio.dart';
import 'package:yesnoapp/domain/entities/message.dart';
import 'package:yesnoapp/infrastructure/yes_no_model.dart';

class GetYessNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    try {
      final response = await _dio.get('https://yesno.wtf/api');

      final YessNoModel yessNoModel = YessNoModel.fromJsonMap(response.data);
      return yessNoModel.toMessageEntity();
    } catch (e) {
      return Message(text: 'Error', fromWho: FromWho.your);
    }
  }
}
