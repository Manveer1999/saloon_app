
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
class CustomTextWidget{



  boldText({dynamic text, double size, Color color, TextAlign alignment, int maxLines, TextOverflow textOverflow}) {
    return Container(
        child: Text(text is Map?text[LANGUAGE_TYPE]:text,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontFamily: "Bold",
        ),
          textAlign: alignment??TextAlign.start,
          maxLines: maxLines,
          overflow: textOverflow,
        )
    );
  }


  regularText({dynamic text,double size,Color color, TextAlign alignment,TextDecoration decoration, double letterSpacing, int maxLines, TextOverflow overflow}) {
    return Container(
        child: Text(text is Map?text[LANGUAGE_TYPE]:text,
          style: TextStyle(
            decoration: decoration??TextDecoration.none,
              fontSize: size,
              color: color,
              fontFamily: "Regular",
              letterSpacing: letterSpacing ?? 0.3,
          ),
          textAlign: alignment ?? TextAlign.start,
          maxLines: maxLines,
          overflow: overflow,
        )
    );
  }


  semiboldText({dynamic text,double size,Color color, TextOverflow textOverFlow,TextAlign alignment, TextDecoration decoration}) {
    return Container(
        child: Text(text is Map?text[LANGUAGE_TYPE]:text,
          style: TextStyle(
              fontSize: size,
              color: color,
             // letterSpacing: .5,
              fontWeight: FontWeight.w500,
              fontFamily: "Semibold",
            decoration: decoration ?? TextDecoration.none
          ),
          textAlign: alignment??TextAlign.start,
          overflow: textOverFlow,
        )
    );
  }



  CustomTextWidget();


}

