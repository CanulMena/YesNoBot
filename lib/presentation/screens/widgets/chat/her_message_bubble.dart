import 'package:flutter/material.dart';
import 'package:practice_yesno/domain/entities/messages.dart';

class HerMessageBubble extends StatelessWidget {

  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;//entender esta linea de codigo
    //El MediaQuery nos da datos generales sobre el dispositivo que lo esta usando| El context tambien contrae inf. de todo el arbol de widgets
    final size = MediaQuery.of(context).size;
    return Column(
      //Cuando queremos mover de ezquierda a derecha una columna, usamos esta propiedad de column:
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: colors.secondary,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(message.text),
            ),
          ),
        ),
        const SizedBox(height: 4,),
        _Imagebubble(message: message, size: size),
        const SizedBox(height: 8,)
        
      ],
    );
  }
}

class _Imagebubble extends StatelessWidget {
  const _Imagebubble({
    // super.key,
    required this.message,
    required this.size,
  });

  final Message message;
  final Size size;

  @override
  Widget build(BuildContext context) {
        //Este widget 'ClipRRect' es como tener un contenedor pero que pueda hacer redondo
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.network(
        '${message.imageUrl}',
        height: 170,
        width: size.width * 0.7,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          //Podemos crear una condicion sin un return. Caso contrario hacer un ternario
          if(loadingProgress == null) return child;
          return Container(
            height: 170,
            width: size.width * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Text('She is sending a message'),
          );
        },
        ),

    );
  }
}