import 'package:flutter/material.dart';
import 'package:yesnoapp/config/helpers/get_yess_no_answer.dart';
import 'package:yesnoapp/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  final List<Message> _messages = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Hola', fromWho: FromWho.me),
  ];

  List<Message> get messages => _messages;

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    _messages.add(Message(text: text, fromWho: FromWho.me));
    notifyListeners();
    moveScrollToBottom();

    if (text.endsWith('?')) {
      final Message message = await GetYessNoAnswer().getAnswer();
      _messages.add(message);
      notifyListeners();
      moveScrollToBottom();
    }
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
