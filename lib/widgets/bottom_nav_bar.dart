import 'package:flutter/material.dart';
import 'package:flex_yemen_ultimate/utils/constants.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final bool isDarkMode;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.isDarkMode,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: isDarkMode ? AppColors.darkBackground : AppColors.lightBackground,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home_filled, AppStrings.home, 0),
            _navItem(Icons.map_outlined, AppStrings.maps, 1),
            _navItem(Icons.storefront_outlined, AppStrings.store, 2),
            const SizedBox(width: 40), // مساحة للـ FAB
            _navItem(Icons.account_balance_wallet_outlined, AppStrings.wallet, 3),
            _navItem(Icons.chat_bubble_outline_rounded, AppStrings.chat, 4),
            _navItem(Icons.person_outline_rounded, AppStrings.profile, 5),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final isSelected = currentIndex == index;
    return InkWell(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.primaryGold : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.primaryGold : Colors.grey,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
