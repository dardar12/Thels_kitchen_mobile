import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/recipe_providers.dart';
import 'screens/landing_screen.dart';

void main() {
  runApp(const ProviderScope(child: ThelsKitchenApp()));
}

class ThelsKitchenApp extends ConsumerWidget {
  const ThelsKitchenApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Thel's Kitchen.",
      theme: ThemeData(colorSchemeSeed: Colors.amber, useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber, brightness: Brightness.dark),
      ),
      themeMode: themeMode,
      home: const LandingScreen(),
    );
  }
}