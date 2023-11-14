import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

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
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('Her message'),
            ),
          ),
        ),
        const SizedBox(height: 4,),
        //Este widget 'ClipRRect' es como tener un contenedor pero que pueda hacer redondo
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            'https://yesno.wtf/assets/no/18-1ba72d815ec0e2bff8dba8699a50e275.gif',
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

        ),
        const SizedBox(height: 8,)
        
      ],
    );
  }
}