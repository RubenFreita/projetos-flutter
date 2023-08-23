import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  List<Map<String, Object>> screens = [
    {"title": "Categorias", "screen": CategoriesScreen()},
    {"title": "Meus Favoritos", "screen": FavoriteScreen()}
  ];

  void _selectedScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screens[_selectedScreenIndex]["title"] as String),
      ),
      body: screens[_selectedScreenIndex]["screen"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        onTap: _selectedScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categorias",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorite",
          ),
        ],
      ),
    );

    // TAB NA PARTE DEBAIXO DO APPBAR
    // DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text("Vamos Cozinhar?"),
    //       bottom: const TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: "Categorias",
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: "Favoritos",
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: const TabBarView(
    //       children: [
    //         CategoriesScreen(),
    //         FavoriteScreen(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
