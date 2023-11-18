import 'package:flutter/material.dart';
import 'package:practice_yesno/domain/entities/messages.dart';
import 'package:practice_yesno/presentation/providers/chat_provider.dart'; 
import 'package:practice_yesno/presentation/screens/widgets/chat/her_message_bubble.dart';
import 'package:practice_yesno/presentation/screens/widgets/chat/my_message_bubble.dart';
import 'package:practice_yesno/presentation/screens/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(3.5),
          child: CircleAvatar(
            backgroundImage:  NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Emma_Watson_2013.jpg/300px-Emma_Watson_2013.jpg'),
          ),
        ),
        title: const Text('Mylove Emma Watson'),
      ),
      body: const MessageChat(),
    );
  }
}

class MessageChat extends StatelessWidget {
  const MessageChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder:(context, index) {
                  final messages = chatProvider.messageList[index];
                  return (messages.fromQuo == FromQuo.hers)
                  ? const HerMessageBubble()
                  : MyMessageBubble(message: messages,);
                },
                )
              ), 
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            )

          ],
        ),
      ),
    );
  }
}
