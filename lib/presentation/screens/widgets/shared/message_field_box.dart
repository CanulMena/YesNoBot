import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;

    final textController = TextEditingController(); //*Le agregamos un controlador al TextFormField

    final focuesNode = FocusNode(); //*Es para poder hacer acciones de mas. 

    final UnderlineInputBorder outlineInputBorder = UnderlineInputBorder(
          borderSide: const BorderSide( color: Colors.white ),
          borderRadius: BorderRadius.circular(25),
        );

    final InputDecoration inputDecoration = InputDecoration( //*Agregamos el input decoracion
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        hintText: 'End your message with a "??"',
        filled: true,

        suffixIcon: IconButton( //*este es el icon que parace en la parte derecha del textformfield
          onPressed: () {
            //*Aqui ya es el mensaje que enviaremos, cuando apretemos el icono de enviar, pero aún falta terminar la logica de esta parte del codigo
            final textValue = textController.value.text;
            onValue(textValue);
            textController.clear();
          },
          icon: const Icon(Icons.send)
        ),
      );

    return TextFormField(
      onTapOutside: (event) {
        focuesNode.unfocus(); //*Esto es para que se cierre el form si toco afuera de la pantala
      },
      focusNode: focuesNode,
      controller: textController,//*Agregamos el controlador que creamos
      decoration: inputDecoration, //*Es para decorar el TextFormField
      //*Con esta propiedad de TexFormFielda agregamos el sumit del valor cuado le damos a la flecha de terminar de escribir(Sumit)
      onFieldSubmitted: (value) { //! Esto es lo que se ejecuta cuando manamos el valor.
        onValue(textController.value.text);
        textController.clear();
        focuesNode.requestFocus();
      },
    );
  }
}