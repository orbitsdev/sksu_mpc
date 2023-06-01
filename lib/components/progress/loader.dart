import 'package:flutter/material.dart';




class Loader extends StatelessWidget {
  double? width;
  double? height;
  Color? color;
   Loader({
    Key? key,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox( width:width, height:height, child: Center(child: CircularProgressIndicator(color: color),),);
  }
}
