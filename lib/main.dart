import 'package:flutter/material.dart';
import 'package:movie_project/screens/HomeProfile.dart';
import 'package:movie_project/screens/Search.dart';
import 'package:movie_project/screens/login.dart';
import 'package:movie_project/screens/moviesScreen.dart';
import 'package:provider/provider.dart';
import 'Models/users.dart';
import 'providers/darkTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  final User? user;

  const MyApp({super.key, this.user});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      MoviesScreen(user: widget.user),
      Search(),
      Login(),
    ];
  }

  void _onBottomNavigationBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => darktheme())],
      child: Consumer<darktheme>(builder: (context, provider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: provider.isDark ? ThemeData.dark() : ThemeData.light(),
          home: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              onTap: _onBottomNavigationBarTapped,
              currentIndex: _selectedIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            ),
            body: _selectedIndex == 2 && widget.user != null
                ? HomeProfile(widget.user!)
                : _screens[_selectedIndex],
          ),
        );
      }),
    );
  }
}
