import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:heroicons/heroicons.dart';
import 'package:sksumpc/components/h.dart';
import 'package:sksumpc/components/s_adapter.dart';
import 'package:sksumpc/components/sv.dart';
import 'package:sksumpc/components/v.dart';
import 'package:sksumpc/utils/helpers/asset.dart';
import 'package:sksumpc/utils/themes/app_color.dart';
import 'package:sksumpc/utils/themes/app_theme.dart';

class LoansScreen extends StatelessWidget {
  const LoansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: CustomScrollView(slivers: [
        S(
          child: const Text(
           'Loans ',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          )
              .animate()
              .moveY(begin: -30, end: 0)
              .fadeIn(duration: const Duration(milliseconds: 700)),
        ),
        S(
          child: Text(
            'Transactions History',
            style: AppTheme.bodytext
                .copyWith(fontSize: 12, color: AppColor.secondaryText),
          ),
        ),
        const SV(16),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.only(bottom: 10),
                constraints: const BoxConstraints(minHeight: 120),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Monday, 1:20  AM',
                      style: AppTheme.bodytext.copyWith(
                        fontSize: 14,
                        color: AppColor.secondaryText,
                      ),
                    ),
                    const V(10),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        constraints: const BoxConstraints(minHeight: 60),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 8,
                                  spreadRadius: 0,
                                  color: AppColor.main.withOpacity(0.1))
                            ],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                width: 0.5, color: AppColor.greyBackground)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    height: 54,
                                    width: 54,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60 * 2),
                                      border: Border.all(
                                          width: 1, color: AppColor.greyBackground),
                                    ),
                                    child: Center(
                                      child: HeroIcon(HeroIcons.creditCard,
                                          style: HeroIconStyle.solid),
                                    ),
                                  ),
                                  const H(16),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Subheading' * 3,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Body Text',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColor.secondaryText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            childCount: 20, // Number of items in the list
          ),
        ),
      ]),
    );
  }
}
