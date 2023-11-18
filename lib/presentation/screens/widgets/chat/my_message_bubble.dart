import 'package:flutter/material.dart';
import 'package:practice_yesno/domain/entities/messages.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({
    super.key,
    required this.message,
    });
//Cuando es un widget no se suele utilizar atributos de widget. Pero dentro del metodo built si. Pues si no, cada que se llame al widget se necesitará agregar el valor del widget que depende
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      //Cuando queremos mover de ezquierda a derecha una columna, usamos esta propiedad de column:
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: colors.primary,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(message.text),
            ),
          ),
        ),
        const SizedBox(height: 5,)
      ],
    );
  }
}