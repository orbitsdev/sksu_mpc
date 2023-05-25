import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:heroicons/heroicons.dart';
import 'package:sksumpc/components/h.dart';
import 'package:sksumpc/components/s_adapter.dart';
import 'package:sksumpc/components/sv.dart';
import 'package:sksumpc/components/v.dart';
import 'package:sksumpc/database/seeders/transaction_seeder.dart';
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
        // S(
        //   child: const Text(
        //     'Loans ',
        //     style: TextStyle(
        //       fontSize: 28,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   )
        //       .animate()
        //       .moveY(
        //         curve: Curves.easeInOut,
        //         begin: 10,
        //         end: 0,
        //         duration: const Duration(
        //           milliseconds: 700,
        //         ),
        //       )
        //       .fadeIn(
        //           curve: Curves.easeInOut,
        //           duration: const Duration(milliseconds: 700)),
        // ),
        // S(
        //   child: Text(
        //     'Transactions History',
        //     style: AppTheme.bodytext
        //         .copyWith(fontSize: 12, color: AppColor.secondaryText),
        //   )
        //       .animate()
        //       .moveY(
        //         curve: Curves.easeInOut,
        //         begin: 10,
        //         end: 0,
        //         duration: const Duration(
        //           milliseconds: 900,
        //         ),
        //       )
        //       .fadeIn(
        //           curve: Curves.easeInOut,
        //           duration: const Duration(milliseconds: 900)),
        // ),
        S(
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: AppColor.grey2),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(12),
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.main,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 12,
                              color: AppColor.main1.withOpacity(0.2))
                        ]),
                    child: Center(
                        child: Text(
                      'In Progress',
                      style: AppTheme.bodytext.copyWith(
                          fontWeight: FontWeight.w800, color: Colors.white),
                    )),
                  ),
                ),
                H(16),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.grey2,
                    ),
                    child: Center(
                        child: Text(
                      'All Projects',
                      style: AppTheme.bodytext
                          .copyWith(color: AppColor.secondaryText),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SV(16),
        S(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Base on nothing',
                style: AppTheme.bodytext
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              Row(
                children: [
                  Text(
                    'See all >',
                    style: AppTheme.bodytext.copyWith(
                        color: AppColor.green1,
                        fontSize: 14,
                        fontWeight: FontWeight.w800),
                  ),
                  const H(8)
                ],
              ),
            ],
          ),
        ),
        const SV(8),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: transactions.length,
            (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 1),
                constraints: const BoxConstraints(minHeight: 70),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom:
                          BorderSide(color: AppColor.borderLight, width: 1.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Container(
                            height: 54,
                            width: 54,
                            decoration: BoxDecoration(
                              color: AppColor.green1.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15),
                              // border: Border.all(
                              //     width: 1, color: AppColor.greyBackground),
                            ),
                            child: Center(
                              child: HeroIcon(
                                HeroIcons.fire,
                                style: HeroIconStyle.solid,
                                color: AppColor.green1,
                                size: 28,
                              ),
                            ),
                          ),
                          const H(16),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transactions[index],
                                  style: TextStyle(
                                    height: 1.2,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                V(2),
                                Text(
                                  'Discover Something New',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColor.green1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: HeroIcon(
                          HeroIcons.chevronRight,
                          style: HeroIconStyle.solid,
                          size: 22,
                          color: AppColor.green1,
                        ))
                  ],
                ),
              );
            },
            // Number of items in the list
          ),
        ),
      ]),
    );
  }
}
