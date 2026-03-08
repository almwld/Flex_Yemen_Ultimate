import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/store_screen.dart';
import 'providers/home_provider.dart';
import 'providers/store_provider.dart';

void main() {
  runApp(const FlexYemenApp());
}

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
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.amber,
          fontFamily: 'Cairo',
        ),
        home: StoreScreen(onAdd: () {}),
      ),
    );
  }
}
