import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hand2hand/features/history/presentation/views/history_view.dart';
import 'package:hand2hand/features/home/presentation/views/home_view.dart';
import 'package:hand2hand/features/profile/presentation/views/profile_view.dart';

class CustomBNB extends StatefulWidget {
  const CustomBNB({super.key, });


  @override
  State<CustomBNB> createState() => _CustomBNBState();
}

class _CustomBNBState extends State<CustomBNB> {
  late int cIndex;

  List<Widget> pages = const [
    HomeView(),
    HistoryView(),
    ProfileView(),
  ];

  @override
  void initState() {
    cIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[cIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CrystalNavigationBar(
          currentIndex: cIndex,
          unselectedItemColor: Colors.black38,
          backgroundColor: Colors.white,
          outlineBorderColor: Colors.black12,
          onTap: (p0) {
            setState(() {
              cIndex = p0;
            });
          },
          items: [
            CrystalNavigationBarItem(
              icon: Icons.home,
              unselectedIcon: Icons.home_outlined,
              selectedColor: Color(0xFF3093A8),
            ),
            CrystalNavigationBarItem(
              icon: Icons.history,
              unselectedIcon:Icons.history,
              selectedColor: Color(0xFF3093A8),
            ),
            CrystalNavigationBarItem(
              icon: Icons.account_circle,
              unselectedIcon: Icons.account_circle_outlined,
              selectedColor: Color(0xFF3093A8),
            ),
          ],
        ),
      ),
    );
  }
}
