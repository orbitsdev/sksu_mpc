import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sksumpc/api/api.dart';
import 'package:sksumpc/api/api_http.dart';
import 'package:sksumpc/components/h.dart';
import 'package:sksumpc/components/s_adapter.dart';
import 'package:sksumpc/components/sv.dart';
import 'package:sksumpc/components/v.dart';
import 'package:sksumpc/controllers/member/member_controller.dart';
import 'package:sksumpc/database/seeders/transaction_seeder.dart';
import 'package:sksumpc/models/member.dart';
import 'package:sksumpc/utils/themes/app_color.dart';
import 'package:sksumpc/utils/themes/app_theme.dart';

class LoansScreen extends StatefulWidget {
  const LoansScreen({Key? key}) : super(key: key);

  @override
  State<LoansScreen> createState() => _LoansScreenState();
}

class _LoansScreenState extends State<LoansScreen> {
  final memberController = Get.find<MemberController>();
  List<Member> members = [];
  bool isLoading = false;
  bool hasMoreData = true;
  bool shouldFetchData = true;
  int limit = 30;
  int offset = 0;

  ScrollController _scrollController = ScrollController();

  @override
  initState() {
    super.initState();
    fetchData();

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> refresh() async {
    setState(() {
      members = [];
      isLoading = false;
      hasMoreData = true;
      shouldFetchData = true;
      limit = 50;
      offset = 0;
    });

    fetchData();
  }

  Future<void> fetchData() async {
    if (!isLoading && hasMoreData) {
      setState(() {
        isLoading = true;
      });

      try {
        final response =
            await ApiHttp().getRequest('${Api.members}/$offset/$limit');
        print(response.data['data']);

        if (response.statusCode == 200) {
          List<Member> newData = (response.data['data'] as List<dynamic>)
              .map((e) => Member.fromMap(e as Map<String, dynamic>))
              .toList();
          print(newData.length);
          setState(() {
            members.addAll(newData);
            offset += newData.length;
            isLoading = false;
            hasMoreData = true;
          });
        } else {
          print('not ok');

          print('API request failed with status code ${response.statusCode}');
          setState(() {
            isLoading = false;
            hasMoreData = false;
          });
        }
      } catch (error) {
        print('Error occurred: $error');
        setState(() {
          isLoading = false;
          hasMoreData = false;
        });
      }
    }
  }

  // setState(() => isLoading = true);

  // var newData = [];
  // // List<Member> newData = (response.data['data'] as List<dynamic>)
  // //     .map((e) => Member.fromMap(e as Map<String, dynamic>))d
  // //     .toList();

  // if (newData.isNotEmpty) {
  //   setState(() {
  //     // members.addAll(newData);
  //     offset = members.length;
  //   });
  // }

  // if (newData.length < limit) {
  //   setState(() {
  //     hasMoreData = false;
  //   });
  // }

  // setState(() => isLoading = false);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: CustomScrollView(controller: _scrollController, slivers: [
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
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.grey2),
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
                        'SKSU Cooperative'.toUpperCase(),
                        style: AppTheme.bodytext.copyWith(
                            fontWeight: FontWeight.w800, color: Colors.white),
                      )),
                    ),
                  ),
                  // H(16),
                  // Flexible(
                  //   child: Container(
                  //     padding: EdgeInsets.all(12),
                  //     width: MediaQuery.of(context).size.width,
                  //     height: MediaQuery.of(context).size.height,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8),
                  //       color: AppColor.grey2,
                  //     ),
                  //     child: Center(
                  //         child: Text(
                  //       'Other Information',
                  //       style: AppTheme.bodytext
                  //           .copyWith(color: AppColor.secondaryText),
                  //     )),
                  //   ),
                  // ),
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
                  'List of Members',
                  style: AppTheme.bodytext
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w800),
                ),
                Row(
                  children: [
                    Text(
                      'Scroll Down ',
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
              childCount: members.length + 1,
              (BuildContext context, int index) {
                if (index < members.length) {
                  final member = members[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 1),
                    constraints: const BoxConstraints(minHeight: 70),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(
                              color: AppColor.borderLight, width: 1.0)),
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
                                    HeroIcons.user,
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
                                      '${member.first_name} ${member.last_name}',
                                      style: TextStyle(
                                        height: 1.2,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    V(2),
                                    Text(
                                      'Tin - ${member.tin_number ?? 'None'}',
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
                } else if (isLoading) {
                  // return SizedBox(
                  //   width: 200.0,
                  //   height: 100.0,
                  //   child: Shimmer.fromColors(
                  //       baseColor: Colors.grey[300]!,
                  //       highlightColor: Colors.grey[100]!,
                  //       child: Container(
                  //         height: 60,
                  //       )),
                  // );
                  return Container(
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColor.green1,
                      ),
                    ),
                  );
                } else {
                  return Text(
                    'No More Data',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColor.secondaryText),
                  ).paddingOnly(bottom: 16, top: 16);
                }
              },
              // Number of items in the list
            ),
          ),
        ]),
      ),
    );
  }
}
