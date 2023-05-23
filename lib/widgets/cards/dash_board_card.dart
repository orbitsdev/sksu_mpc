import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import 'package:sksumpc/models/overview.dart';
import 'package:sksumpc/utils/themes/app_color.dart';
import 'package:sksumpc/utils/themes/app_theme.dart';
import 'package:sksumpc/widgets/graphs/pie_chart.dart';
import 'package:sksumpc/widgets/v.dart';

class DashBoardCard extends StatelessWidget {


final Overview overview;
  const DashBoardCard({
    Key? key,
    required this.overview,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 155,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.greyBackground,
          width: 0.5,
        ),
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
      padding: EdgeInsets.symmetric(horizontal:4, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

            Text(
              overview.header,
              style: TextStyle(
                fontSize: 14,
                height: 0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const V(2),
            Text(
              overview.subheader,
              style: TextStyle(
                fontSize: 18,
                color: AppColor.green1,
                fontWeight: FontWeight.bold
              ),
            ),
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
