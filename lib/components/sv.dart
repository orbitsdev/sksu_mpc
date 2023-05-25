



import 'package:flutter/material.dart';

class SV extends StatelessWidget {

  final double height;
    const SV(this.height,); 

  @override
  Widget build(BuildContext context){
     return SliverToBoxAdapter(
       child: SizedBox(
        height: height,
         ),
     );
  }
}
