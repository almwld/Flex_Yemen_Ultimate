import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// --- Providers Section ---
class HomeProvider with ChangeNotifier {}
class StoreProvider with ChangeNotifier {
  List get stores => [];
  List get products => [];
}

void main() => runApp(const FlexYemenApp());

class FlexYemenApp extends StatelessWidget {
  const FlexYemenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => StoreProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.amber),
        home: const StoreScreen(),
      ),
    );
  }
}

// --- Store Screen Section ---
class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});
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
        title: const Text("متجر فلكس يمن"),
        bottom: TabBar(
          controller: _tab,
          tabs: const [Tab(text: "الكل"), Tab(text: "متاجر"), Tab(text: "منتجات")],
        ),
      ),
      body: TabBarView(
        controller: _tab,
        children: const [
          Center(child: Text("يتم الآن تجهيز كافة المتاجر...")),
          Center(child: Text("قائمة المتاجر المعتمدة")),
          Center(child: Text("أحدث المنتجات اليمنية")),
        ],
      ),
    );
  }
}
