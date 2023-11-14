import 'package:flutter/material.dart'; 
import 'package:practice_yesno/presentation/screens/widgets/chat/her_message_bubble.dart';
import 'package:practice_yesno/presentation/screens/widgets/chat/my_message_bubble.dart';
import 'package:practice_yesno/presentation/screens/widgets/shared/message_field_box.dart';

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder:(context, index) {
                  return ( index % 2 == 0)
                  ? const HerMessageBubble()
                  : const MyMessageBubble();
                },
                )
              ), 
            const MessageFieldBox()

          ],
        ),
      ),
    );
  }
}

//los widgets son clases