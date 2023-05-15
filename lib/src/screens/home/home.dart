import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:setram/src/screens/home/my_documents/my_documents.dart';
import 'package:setram/src/screens/home/my_planning/my_planning.dart';
import 'package:setram/src/screens/home/principle/principle.dart';
import 'package:setram/src/screens/home/profile/profile.dart';
import 'package:setram/src/screens/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Principle(),
    MyDocuments(),
    MyPlanning(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 244, 255, 1),
      appBar: const TopNavBar(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onTabPress: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class TopNavBar extends StatelessWidget implements PreferredSizeWidget {
  const TopNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      foregroundColor: Colors.black,
      elevation: 0.0,
      title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "SETRAM",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Material(
                  type: MaterialType.transparency,
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.notifications);
                      },
                      borderRadius: BorderRadius.circular(50.0),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(LineIcons.bell),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -8,
                  right: -8,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 123, 0, 245),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      "10",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) onTabPress;

  const BottomNavigation(
      {Key? key, required this.onTabPress, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.grey.withOpacity(.04),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: GNav(
          rippleColor: Colors.grey.shade300,
          hoverColor: Colors.grey.shade100,
          gap: 8,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          activeColor: Colors.black,
          tabBackgroundColor: Colors.grey.shade50,
          color: Colors.black,
          selectedIndex: selectedIndex,
          onTabChange: onTabPress,
          tabs: const [
            GButton(icon: LineIcons.home, text: 'Accueil'),
            GButton(icon: LineIcons.alternateFile, text: 'Documents'),
            GButton(icon: LineIcons.calendar, text: 'Planning'),
            GButton(icon: LineIcons.user, text: 'Profile'),
          ],
        ),
      ),
    );
  }
}
