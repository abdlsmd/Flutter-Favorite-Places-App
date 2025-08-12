import 'package:favourite_places/providers/theme_provider.dart';
import 'package:favourite_places/screens/places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Great Places',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: const PlacesScreen(),
    );
  }
}