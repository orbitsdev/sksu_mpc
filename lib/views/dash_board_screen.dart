import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sksumpc/models/overview.dart';
import 'package:sksumpc/utils/themes/app_color.dart';
import 'package:sksumpc/widgets/cards/dash_board_card.dart';
import 'package:sksumpc/widgets/v.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.grey2,
      padding: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const V(10),
          Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ).animate().moveX(begin: -30, end: 0).fadeIn(duration: const Duration(milliseconds: 1300)),
          const V(16),
          Expanded(
            child: MasonryGridView.count(
              physics:const  NeverScrollableScrollPhysics(),
              itemCount: overview.length,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              itemBuilder: (context, index) {
                return DashBoardCard(
                  overview: overview[index],
                ).animate().scale(duration: const Duration(milliseconds: 300)).fadeIn(duration: const Duration(milliseconds: 1300));
              },
            ),
          ),
          const V(12),
          // Container(
          //   padding: const EdgeInsets.only(top: 14, right: 16 , left: 16, bottom: 8),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          //   height: 100,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Container(),
          //       Text(
          //         'Overview',
          //         style: TextStyle(
          //             fontSize: 18,
          //             height: 1,
          //             color: Colors.black,
          //             fontWeight: FontWeight.bold),
          //       ),
          //       V(14),
          //     ],
          //   ),
          // ),
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
