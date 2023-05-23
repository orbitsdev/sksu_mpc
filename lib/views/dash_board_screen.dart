
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sksumpc/models/overview.dart';
import 'package:sksumpc/widgets/cards/dash_board_card.dart';
import 'package:sksumpc/widgets/v.dart';


class DashBoardScreen extends StatelessWidget {
const DashBoardScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14,),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const V(10),
          Expanded(
            child: MasonryGridView.count(
              itemCount: overview.length,
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemBuilder: (context, index) {
              return DashBoardCard(overview: overview[index],);
            },
          ),
          ),
        ],
      ),
      
//        GridView.custom(
//   gridDelegate: SliverQuiltedGridDelegate(
//     crossAxisCount: 4,
//     mainAxisSpacing: 4,
//     crossAxisSpacing: 4,
//     repeatPattern: QuiltedGridRepeatPattern.inverted,
//     pattern: [
//       QuiltedGridTile(2, 2),
//       QuiltedGridTile(1, 1),
//       QuiltedGridTile(1, 1),
//       QuiltedGridTile(1, 2),
//     ],
//   ),
//   childrenDelegate: SliverChildBuilderDelegate(
//     (context, index) =>Container(
//       padding: EdgeInsets.all(4),
//       color: Colors.grey,
//       child: Text('lorem het the ' * index),
//     ),
//   ),
// ),
    );
    // return Padding(
    //     padding: EdgeInsets.all(16.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           'Heading',
    //           style: TextStyle(
    //             fontSize: 28,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //         SizedBox(height: 10),
    //         Text(
    //           'Subheading',
    //           style: TextStyle(
    //             fontSize: 18,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //         SizedBox(height: 10),
    //         Text(
    //           'Body Text',
    //           style: TextStyle(
    //             fontSize: 14,
    //           ),
    //         ),
    //         SizedBox(height: 10),
    //         Text(
    //           'Small Text lorem ' * 20,
    //           style: TextStyle(
    //             fontSize: 12,
    //           ),
    //         ),
    //       ],
    //     ));
  }
}