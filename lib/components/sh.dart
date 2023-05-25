import 'package:flutter/material.dart';

class SH extends StatelessWidget {

  final double width;
  const SH(this.width,); 

  @override
  Widget build(BuildContext context){
     return SliverToBoxAdapter(
       child: SizedBox(
        width: width,
         ),
     );
  }
}
