import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:sksumpc/components/h.dart';
import 'package:sksumpc/controllers/auth/auth_controller.dart';
import 'package:sksumpc/utils/helpers/asset.dart';
import 'package:sksumpc/utils/themes/app_color.dart';
import 'package:sksumpc/utils/themes/app_theme.dart';
import 'package:sksumpc/views/dash_board_screen.dart';
import 'package:sksumpc/views/loans_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final authController = Get.find<AuthController>();
  final storage = new FlutterSecureStorage();
  List<Widget> _pages = [
    DashBoardScreen(),
    LoansScreen(),
    Container(
      child: Center(child: Text('page3')),
    ),
    Container(
      child: Center(child: Text('page4')),
    ),
    Container(
      child: Text('page4'),
    ),
  ];

  int currentIndex = 1;
  late TabController tabController;
  late String token;
  @override
  void initState() {
    tabController = TabController(length: _pages.length, vsync: this);

    super.initState();
  }

  void readToken() async {
    token = await storage.read(key: 'token') as String;
    print(token);
  }

  void changeTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            children: [
              ListTile(
                onTap: ()=>authController.logout(context:context),
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
              ListTile(
                title: Text('More Features'),
              ),
              ListTile(
                title: Text('More Features'),
              ),
              ListTile(
                title: Text('More Features'),
              ),
              ListTile(
                title: Text('More Features'),
              ),
            ],
          ),
        ),
      ),
      // appBar: AppBar(

      //   leading: Builder(
      //     builder: (context) {
      //       return Container(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(4),
      //           color: AppColor.main,
      //         ),
      //         width: 24,
      //         height: 24,
      //       ) ;
      //       // IconButton(
      //       //   icon: const Icon(Icons.menu, color: AppColor.main),
      //       //   onPressed: ()=> openDrawer(context),
      //       // );
      //     }
      //   ),
      //   actions: [
      //     Image.asset(width: 30, height: 30, Asset.image('sksu_logo.png')),
      //     const H(4),
      //     Image.asset(width: 31, height: 31, Asset.image('mpc_logo.png')),
      //     const H(4),
      //     Image.asset(width: 118, Asset.image('sksu_coop_logo.png')),
      //     const H(20),
      //   ],
      // ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Builder(builder: (context) {
                      return InkWell(
                        onTap: () => openDrawer(context),
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: AppColor.main,
                          ),
                          child: const HeroIcon(
                            HeroIcons.bars3BottomLeft,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      );
                    }),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(Asset.image('sksu_logo.png'),
                              width: 33, height: 33),
                          const H(4),
                          Image.asset(Asset.image('mpc_logo.png'),
                              width: 34, height: 34),
                          const H(4),
                          Image.asset(Asset.image('sksu_coop_logo.png'),
                              width: 128),
                        ],
                      ),
                    ),
                    const H(6),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: _pages[currentIndex],
            ),
          ],
        ),
      ),

      bottomNavigationBar: SalomonBottomBar(
        selectedItemColor: AppColor.green2,
        unselectedItemColor: Colors.white,
        backgroundColor: AppColor.main1,
        currentIndex: currentIndex,
        onTap: changeTab,
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const HeroIcon(
              HeroIcons.squares2x2,
              style: HeroIconStyle.outline,
            ),
            title: Text(
              "Dashboard",
              style: AppTheme.bodytext,
            ),
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const HeroIcon(
              HeroIcons.home,
              style: HeroIconStyle.outline,
            ),
            title: Text(
              "Home",
              style: AppTheme.bodytext,
            ),
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const HeroIcon(
              HeroIcons.documentChartBar,
              style: HeroIconStyle.outline,
            ),
            title: Text(
              "Loans",
              style: AppTheme.bodytext,
            ),
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const HeroIcon(
              HeroIcons.cog6Tooth,
              style: HeroIconStyle.outline,
            ),
            title: Text(
              "Settings",
              style: AppTheme.bodytext,
            ),
          ),
        ],
      ),

      //  bottomNavigationBar: ResponsiveNavigationBar(
      //   backgroundOpacity: 1,
      //   backgroundBlur: 0,

      //   backgroundColor:  AppColor.darkBg,
      //     selectedIndex: currentIndex,
      //     onTabChange: changeTab,
      //     // showActiveButtonText: false,
      //     textStyle:  TextStyle(
      //       color: Colors.white,
      //      fontSize: 10,
      //     ),
      //     navigationBarButtons: const <NavigationBarButton>[
      //       NavigationBarButton(
      //         text: 'Home',
      //         icon: Icons.people,
      //         backgroundGradient: LinearGradient(
      //           colors: [AppColor.green3, AppColor.green3,],
      //         ),
      //       ),
      //       NavigationBarButton(
      //         text: 'Tab 2',
      //         icon: Icons.star,
      //         backgroundGradient: LinearGradient(
      //           colors: [AppColor.green3, AppColor.green3,],
      //         ),
      //       ),
      //       NavigationBarButton(
      //         text: 'Tab 3',
      //         icon: Icons.settings,
      //         backgroundGradient: LinearGradient(
      //           colors: [AppColor.green3, AppColor.green3,],
      //         ),
      //       ),
      //     ],
      //   ),

      // bottomNavigationBar: FlashyTabBar(
      //   backgroundColor:  AppColor.main,
      //   animationCurve: Curves.linear,
      //   selectedIndex: currentIndex,
      //   iconSize: 28,
      //   showElevation: true, // use this to remove appBar's elevation
      //   onItemSelected: (index) => setState(() {
      //     currentIndex = index;
      //   }),
      //   items: [

      //     FlashyTabBarItem(
      //       activeColor:AppColor.green2,
      //       inactiveColor: Colors.white,
      //       icon:const  HeroIcon(
      //         HeroIcons.home,
      //         style:
      //             HeroIconStyle.outline, // Outlined icons are used by default.
      //       ),
      //       title: Text('Home'),
      //     ),
      //     FlashyTabBarItem(
      //       activeColor:AppColor.green2,
      //       inactiveColor: Colors.white,
      //       icon:const  HeroIcon(
      //         HeroIcons.squares2x2,
      //         style:
      //             HeroIconStyle.outline, // Outlined icons are used by default.
      //       ),
      //       title: Text('Dashboard'),
      //     ),
      //     FlashyTabBarItem(
      //       activeColor:AppColor.green2,
      //       inactiveColor: Colors.white,
      //       icon:const  HeroIcon(
      //         HeroIcons.documentChartBar,
      //         style:
      //             HeroIconStyle.outline, // Outlined icons are used by default.
      //       ),
      //       title: Text('Loan'),
      //     ),
      //     FlashyTabBarItem(
      //       activeColor:AppColor.green2,
      //       inactiveColor: Colors.white,
      //       icon:const  HeroIcon(
      //         HeroIcons.cog6Tooth,
      //         style:
      //             HeroIconStyle.outline, // Outlined icons are used by default.
      //       ),
      //       title: Text('Settings'),
      //     ),
      //   ],
      // ),
    );
  }
}
