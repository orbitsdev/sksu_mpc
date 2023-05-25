import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:sksumpc/components/h.dart';
import 'package:sksumpc/components/v.dart';

import 'package:sksumpc/models/overview.dart';
import 'package:sksumpc/utils/themes/app_color.dart';
import 'package:sksumpc/utils/themes/app_theme.dart';


class DashBoardCard extends StatelessWidget {


final Overview overview;
  const DashBoardCard({
    Key? key,
    required this.overview,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const  BoxConstraints(
        minHeight: 140,
      ),
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: AppColor.greyBackground,
        //   width: 0.5,
        // ),
        boxShadow: [
          // BoxShadow(
          //   offset: Offset(0,1),
          //   blurRadius: 12,
          //   spreadRadius: 1,
          //   color: Colors.black.withOpacity(0.03)
          // )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.only(top: 14, right: 16 , left: 16, bottom: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

            Text(
              overview.header,
              style:const  TextStyle(
                fontSize: 14,
                height: 0,
              ),
              textAlign: TextAlign.center,
            ),
            const V(10),
            Text(
              overview.subheader,
              style: const  TextStyle(
                fontSize: 26,
                height: 1,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
            const V(14),
            Row(
              children: [
                ClipOval(
                  child: Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      color: AppColor.green1.withOpacity(0.2),
                    ),
                    child:   HeroIcon(
                       overview.icon ,
                      size: 18,
                      color: AppColor.main,
                      style: HeroIconStyle.solid,
                    ),
                  ),
                ),
                const H(8),
                Text('10.06%', style: AppTheme.bodytext.copyWith(
                  color: AppColor.green1,
                ),),
               
              ],
            ),
//  const V(8),
//                 Text('1 months', style: AppTheme.bodytext.copyWith(
//                   fontSize: 12,
//                   color: Colors.black.withOpacity(0.40),
//                 ),),

            // SizedBox(height: 10),
          //   Text(
          //     'Small Text lorem ' * 20,
          //     style: TextStyle(
          //       fontSize: 12,
          //     ),
          //   ),
          // const V(10),
          // Text(
          //   'Total Shares',
          //   style: TextStyle(
          //     fontSize: 14,
          //   ),
          // ),
          // Text(
          //   'Php 100,000.00',
          //   style: TextStyle(
          //       fontSize: 18,
          //       color: AppColor.green1,
          //       fontWeight: FontWeight.bold),
          // ),
          // const V(4),
          // Center(
          //   child: HeroIcon(
          //     style: HeroIconStyle.solid,
          //     HeroIcons.globeEuropeAfrica,
          //     color: AppColor.greyBackground,
          //     size: 60,
          //   ),
          // ),
          // Text(
          //   'Small Text lorem ' * 4,
          //   style: TextStyle(
          //     fontSize: 12,
          //   ),
          // ),
        ],
      ),
    );
  }
}
