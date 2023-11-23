import 'package:flutter/material.dart';
import 'package:practice_yesno/config/helpers/get_yes_no_answer.dart';
import 'package:practice_yesno/domain/entities/messages.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController  = ScrollController();

  final GetYesNoAnswer  getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {
    if(text.isEmpty) return;
    final Message message = Message(text: text, fromQuo: FromQuo.me);
    messageList.add(message);

    if( text.endsWith('?')){
      herReply();
    } 
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

  Future<void> herReply() async{
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    moveControlScroll();
    notifyListeners();    
  }

  
}