import 'package:flutter/material.dart';
import 'package:klontong/screen/home_screen.dart';
import 'package:provider/provider.dart';

import 'provider/product_provider.dart';
import 'util/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => di.sl<ProductProvider>(),
        )
      ],
      child: MaterialApp(
        title: 'Klontong',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
