import 'package:flutter/material.dart';
import 'package:flex_yemen_ultimate/utils/constants.dart';

class StoreScreen extends StatelessWidget {
  final VoidCallback? onAdd;

  const StoreScreen({super.key, this.onAdd});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      padding: const EdgeInsets.all(16),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _buildCategory(Icons.shopping_cart, "الماركت"),
        _buildCategory(Icons.restaurant, "مطاعم"),
        _buildCategory(Icons.phone_iphone, "تقنية"),
        _buildCategory(Icons.watch, "اكسسوارات"),
        _buildCategory(Icons.health_and_safety, "صحية"),
        _buildCategory(Icons.more_horiz, "المزيد"),
      ],
    );
  }

  Widget _buildCategory(IconData icon, String label) {
    return InkWell(
      onTap: onAdd ?? () {},
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primaryGold, size: 32),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
