import 'package:flutter/material.dart';
import 'package:flex_yemen_ultimate/utils/constants.dart';

class CartBadge extends StatelessWidget {
  final int cartCount;
  final VoidCallback onPressed;

  const CartBadge({
    super.key,
    required this.cartCount,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_bag_outlined, color: AppColors.primaryGold),
          onPressed: onPressed,
        ),
        if (cartCount > 0)
          Positioned(
            right: 8,
            top: 4,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Center(
                child: Text(
                  cartCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
