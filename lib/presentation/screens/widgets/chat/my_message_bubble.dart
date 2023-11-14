import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key});
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
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('My message'),
            ),
          ),
        ),
        const SizedBox(height: 8,)
      ],
    );
  }
}