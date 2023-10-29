import 'package:aniflix/screens/favorite_screen.dart';
import 'package:aniflix/screens/home_screen.dart';
import 'package:aniflix/screens/search_screen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;
  final pageController = PageController(initialPage: 0);
  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: _pages,
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
          ),
          _buildAppBar(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline_outlined),
            label: "Favorite",
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    final mediaQuery = MediaQuery.of(context);
    return Positioned(
      top: 0,
      child: Container(
        height: kToolbarHeight + mediaQuery.padding.top,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          bottom: 8,
          left: 8,
          right: 8,
          top: mediaQuery.padding.top,
        ),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
        ),
        child: Row(
          children: [
            const Text('Aniflix')
          ],
        ),
      ),
    );
  }

}
