import 'package:flutter/material.dart';
import 'package:siaga/app/modules/comunitty/views/comunitty_view.dart';
import 'package:siaga/app/modules/education/views/education_view.dart';
import '../../../data/model/nav_bar.dart';
import '../../../data/model/nav_model.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
// Import the NavModel

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({Key? key}) : super(key: key);

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final searchNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  
  int selectedTab = 0;
  late List<NavModel> items;

  @override
  void initState() {
    super.initState();
    items = [
      NavModel(page: const HomeView(), navKey: homeNavKey),
      NavModel(page:  ComunittyView(), navKey: searchNavKey),
      NavModel(page: const EducationView(), navKey: notificationNavKey),
      NavModel(page: const ProfileView(), navKey: profileNavKey),
    ];
  }

   @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (items[selectedTab].navKey.currentState?.canPop() ?? false) {
          items[selectedTab].navKey.currentState?.pop();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: selectedTab,
          children: items
              .map((page) => Navigator(
                    key: page.navKey,
                    onGenerateInitialRoutes: (navigator, initialRoute) {
                      return [
                        MaterialPageRoute(builder: (context) => page.page),
                      ];
                    },
                  ))
              .toList(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(top: 10),
          height: 64,
          width: 64,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            elevation: 0,
            onPressed: () => debugPrint("Add Button pressed"),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 3, color: Colors.pinkAccent),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Image.asset("assets/icons/helpdesk.png", height: 30, color: Colors.pinkAccent,),
            )
          ),
        ),
        bottomNavigationBar: NavBar(
          pageIndex: selectedTab,
          onTap: (index) {
            if (index == selectedTab) {
              items[index].navKey.currentState?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                selectedTab = index;
              });
            }
          },
        ),
      ),
    );
  }
}