import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final textController = TextEditingController();

    final focuesNode = FocusNode();

    final UnderlineInputBorder outlineInputBorder = UnderlineInputBorder(
          borderSide: BorderSide( color: colors.primary ),
          borderRadius: BorderRadius.circular(12),
        );

    final InputDecoration inputDecoration = InputDecoration(
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        hintText: 'End your message with a "??"',
        filled: true,

        suffixIcon: IconButton(
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
        focuesNode.unfocus();
      },
      focusNode: focuesNode,
      controller: textController,
      decoration: inputDecoration,
      //*Con esta propiedad de TexFormFielda agregamos el sumit del valor cuado le damos a la flecha de terminar de escribir(Sumit)
      onFieldSubmitted: (value) {
        onValue(textController.value.text);
        textController.clear();
        focuesNode.requestFocus();
      },
    );
  }
}