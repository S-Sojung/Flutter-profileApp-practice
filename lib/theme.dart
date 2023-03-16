
import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
    // primaryColor: Colors.white, //앱의 핵심 컬러.. 라기엔이제 따로따로 컬러주는걸로 바뀜
    appBarTheme: AppBarTheme(
      // color: Colors.white,
      // titleTextStyle: TextStyle(color: Colors.black)
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      iconTheme: IconThemeData( //leading 과 action을 따로 설정할 수도 있다...
        color: Colors.blue
      )
    ),
  );
}