import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '/../pages/add_post/add_post_page.dart';
import '/../pages/home/home_page.dart';
import '/../pages/profile/profile_page.dart';
import '../../util/color_util.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final screens = [
    HomePage(),
    const AddPostPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: page,
        children: screens,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const [
          Icon(Icons.home, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: ColorUtil.MAIN_COLOR,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        onTap: (index) {
          debugPrint(screens[index].toString());

          setState(() {
            page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
