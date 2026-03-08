import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/store_provider.dart';

class StoreScreen extends StatefulWidget {
  final VoidCallback onAdd;
  const StoreScreen({super.key, required this.onAdd});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> with SingleTickerProviderStateMixin {
  late TabController _tab;
  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("متجر فلكس"),
        bottom: TabBar(
          controller: _tab,
          tabs: const [Tab(text: "الكل"), Tab(text: "متاجر"), Tab(text: "منتجات")],
        ),
      ),
      body: TabBarView(
        controller: _tab,
        children: [
          _buildBody("قسم الكل"),
          _buildBody("قسم المتاجر"),
          _buildBody("قسم المنتجات"),
        ],
      ),
    );
  }

  Widget _buildBody(String title) => Center(child: Text(title));
}
