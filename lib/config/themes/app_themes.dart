import 'package:flutter/material.dart';

Color _mainColor = const Color.fromARGB(0, 151, 234, 74);

List<Color> _selectColor = [
  _mainColor,
  Colors.blue,
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.pink,
  Colors.purple
];

class ThemesApp {
//el final indica que el atributo de la clase tiene que ser inicializado y la unica forma de hacerloe es con un constructor
  final int optionColor;

  ThemesApp({required this.optionColor})
  : assert( optionColor <= _selectColor.length -1 && optionColor >= 0, 'optionColor debe ser menor o igual a ${_selectColor.length -1} y mayor o igual a 0' );
  
  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _selectColor[optionColor],
    );
  }
}