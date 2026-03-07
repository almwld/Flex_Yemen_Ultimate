import 'package:flutter/material.dart';
import 'package:flex_yemen_ultimate/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          AppStrings.discover,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        _buildFeatureCard(
          'عقارات فاخرة',
          'أفضل الفلل في صنعاء',
          Icons.villa,
        ),
        _buildFeatureCard(
          'سيارات حديثة',
          'عروض معرض فلكس',
          Icons.directions_car,
        ),
        _buildFeatureCard(
          'إلكترونيات',
          'أحدث الأجهزة',
          Icons.phone_android,
        ),
      ],
    );
  }

  Widget _buildFeatureCard(String title, String subtitle, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.primaryGold,
          child: Icon(icon, color: Colors.black),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
