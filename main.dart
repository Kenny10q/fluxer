import 'package:flutter/material.dart';
import 'ui/home_page.dart';

void main() {
  runApp(const FluxerApp());
}

class FluxerApp extends StatelessWidget {
  const FluxerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluxer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
