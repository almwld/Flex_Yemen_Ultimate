import 'package:flutter/material.dart';
import 'package:flex_yemen_ultimate/screens/home_screen.dart';
import 'package:flex_yemen_ultimate/screens/map_screen.dart';
import 'package:flex_yemen_ultimate/screens/store_screen.dart';
import 'package:flex_yemen_ultimate/screens/wallet_screen.dart';
import 'package:flex_yemen_ultimate/screens/profile_screen.dart';
import 'package:flex_yemen_ultimate/widgets/custom_app_bar.dart';
import 'package:flex_yemen_ultimate/widgets/bottom_nav_bar.dart';
import 'package:flex_yemen_ultimate/utils/constants.dart';

void main() => runApp(const FlexYemenApp());

class FlexYemenApp extends StatefulWidget {
  const FlexYemenApp({super.key});

  @override
  State<FlexYemenApp> createState() => _FlexYemenAppState();
}

class _FlexYemenAppState extends State<FlexYemenApp> {
  bool isDarkMode = true;
  int cartCount = 0;
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeScreen(),
      const MapScreen(),
      StoreScreen(onAdd: _addToCart),
      const WalletScreen(),
      const ProfileScreen(),
    ];
  }

  void _addToCart() {
    setState(() => cartCount++);
  }

  void _toggleTheme() {
    setState(() => isDarkMode = !isDarkMode);
  }

  void _onNavItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        fontFamily: 'Cairo',
        brightness: Brightness.light,
        primaryColor: AppColors.primaryGold,
        scaffoldBackgroundColor: AppColors.lightBackground,
      ),
      darkTheme: ThemeData(
        fontFamily: 'Cairo',
        brightness: Brightness.dark,
        primaryColor: AppColors.primaryGold,
        scaffoldBackgroundColor: AppColors.darkBackground,
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: CustomAppBar(
          isDarkMode: isDarkMode,
          cartCount: cartCount,
          onThemeToggle: _toggleTheme,
          onSettingsPressed: () => _onNavItemTapped(4),
          onCartPressed: () {},
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          isDarkMode: isDarkMode,
          onItemTapped: _onNavItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primaryGold,
          elevation: 8,
          child: const Icon(Icons.add_rounded, color: Colors.black, size: 32),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
