import 'package:flutter/material.dart';
import 'package:practice_yesno/domain/entities/messages.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController  = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola mundo', fromQuo: FromQuo.me),
    Message(text: 'Hola mundo', fromQuo: FromQuo.me),
  ];

  Future<void> sendMessage(String text) async {
    if(text.isEmpty) return;
    final Message message = Message(text: text, fromQuo: FromQuo.me);
    messageList.add(message);
    notifyListeners();
    moveControlScroll();
  }

  Future<void> moveControlScroll() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
      );
  }
  
}