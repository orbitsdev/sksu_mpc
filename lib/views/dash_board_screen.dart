import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:sksumpc/components/cards/dash_board_card.dart';
import 'package:sksumpc/components/v.dart';
import 'package:sksumpc/models/overview.dart';
import 'package:sksumpc/utils/helpers/asset.dart';
import 'package:sksumpc/utils/themes/app_color.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.grey2,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const V(10),
          const Text(
            'Dashboard',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          )
              .animate()
              .moveY(
                  begin: 10,
                  end: 0,
                  curve: Curves.easeInOut,
                  duration: const Duration(
                    milliseconds: 700,
                  ))
              .fadeIn(
                duration: const Duration(
                  milliseconds: 700,
                ),
                curve: Curves.easeInOut,
              ),
          const V(8),

          Container(
              height: 120,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColor.green1,
                      AppColor.main,
                      AppColor.main1,
                    ]),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(children: [
                Container(
                        height: MediaQuery.of(context).size.height * 0.40,
                        width: 140,
                        child: Center(
                          child: SvgPicture.asset(
                            height: 80,
                            width: 80,
                            Asset.image('undraw_data_processing_yrrv.svg'),
                          ),
                        ))
                    .animate()
                    .moveX(
                        begin: -10,
                        end: 0,
                        curve: Curves.easeInOut,
                        duration: const Duration(
                          milliseconds: 700,
                        ))
                    .fadeIn(),
                Flexible(
                  child: Container(
                      child: const Center(
                    child: Text('Overview Highlights',
                        style: TextStyle(
                            height: 1.2, fontSize: 28, color: Colors.white),
                        textAlign: TextAlign.center),
                  )
                          .animate()
                          .moveX(
                              begin: 10,
                              end: 0,
                              curve: Curves.easeInOut,
                              duration: const Duration(
                                milliseconds: 700,
                              ))
                          .fadeIn()),
                ),
              ])),
          const V(24),
          Expanded(
            child: MasonryGridView.count(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: overview.length,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              itemBuilder: (context, index) {
                return DashBoardCard(
                  overview: overview[index],
                )
                    .animate()
                    .scale(
                      duration: const Duration(
                        milliseconds: 700,
                      ),
                      curve: Curves.easeInOut,
                    )
                    .fadeIn(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeInOut,
                    );
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
