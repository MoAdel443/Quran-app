

import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, Color color , FontWeight fontWeight,List<Shadow> shadow)
{
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    fontFamily: FontConstant.fontFamily,
    shadows: shadow
  );
}


// regular style
TextStyle getRegularStyle({double fontSize = 12.0 ,required Color color, List<Shadow> shadow =const []})
{
  return _getTextStyle(
      fontSize,
      color,
      FontWeight.normal,
      shadow,
  );
}



// bold style
TextStyle getBoldStyle({double fontSize = 16.0,required Color color, List<Shadow> shadow =const []}){
  return _getTextStyle(fontSize, color, FontManager.bold,shadow);
}
