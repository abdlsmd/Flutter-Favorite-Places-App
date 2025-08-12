import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Theme mode provider
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

// ========== Professional Dark Theme ==========
final darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  // Primary palette
  primary: const Color(0xFFA5C6FF),  // Soft blue
  onPrimary: const Color(0xFF002D62),
  primaryContainer: const Color(0xFF00458A),
  onPrimaryContainer: const Color(0xFFD6E3FF),
  
  // Secondary palette
  secondary: const Color(0xFFB5C9FF),  // Cool gray-blue
  onSecondary: const Color(0xFF1A2E4D),
  secondaryContainer: const Color(0xFF33456B),
  onSecondaryContainer: const Color(0xFFDBE1FF),
  
  // Tertiary palette
  tertiary: const Color(0xFFFFB3AB),  // Soft coral
  onTertiary: const Color(0xFF680003),
  tertiaryContainer: const Color(0xFF930007),
  onTertiaryContainer: const Color(0xFFFFDAD4),
  
  // Error palette
  error: const Color(0xFFFFB4AB),
  onError: const Color(0xFF690005),
  errorContainer: const Color(0xFF93000A),
  onErrorContainer: const Color(0xFFFFDAD6),
  
  // Background palette
  background: const Color(0xFF1A1C1E),  // Dark gray
  onBackground: const Color(0xFFE2E2E6),
  surface: const Color(0xFF1A1C1E),
  onSurface: const Color(0xFFE2E2E6),
  
  // Surface variants
  surfaceVariant: const Color(0xFF42474E),
  onSurfaceVariant: const Color(0xFFC2C7CF),
  outline: const Color(0xFF8C9199),
  
  // Other
  shadow: Colors.black,
  inverseSurface: const Color(0xFFE2E2E6),
  onInverseSurface: const Color(0xFF2F3033),
  surfaceTint: const Color(0xFFA5C6FF),
);

// ========== Professional Light Theme ==========
final lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  // Primary palette
  primary: const Color(0xFF0062A0),  // Deep blue
  onPrimary: Colors.white,
  primaryContainer: const Color(0xFFD0E4FF),
  onPrimaryContainer: const Color(0xFF001D36),
  
  // Secondary palette
  secondary: const Color(0xFF00658D),  // Teal blue
  onSecondary: Colors.white,
  secondaryContainer: const Color(0xFFC6E7FF),
  onSecondaryContainer: const Color(0xFF001E2D),
  
  // Tertiary palette
  tertiary: const Color(0xFF9C4323),  // Warm terracotta
  onTertiary: Colors.white,
  tertiaryContainer: const Color(0xFFFFDBD0),
  onTertiaryContainer: const Color(0xFF390C00),
  
  // Error palette
  error: const Color(0xFFBA1A1A),
  onError: Colors.white,
  errorContainer: const Color(0xFFFFDAD6),
  onErrorContainer: const Color(0xFF410002),
  
  // Background palette
  background: const Color(0xFFFDFCFF),  // Off-white
  onBackground: const Color(0xFF1A1C1E),
  surface: const Color(0xFFFDFCFF),
  onSurface: const Color(0xFF1A1C1E),
  
  // Surface variants
  surfaceVariant: const Color(0xFFDFE3EB),
  onSurfaceVariant: const Color(0xFF42474E),
  outline: const Color(0xFF73777F),
  
  // Other
  shadow: Colors.black12,
  inverseSurface: const Color(0xFF2F3033),
  onInverseSurface: const Color(0xFFF0F0F4),
  surfaceTint: const Color(0xFF0062A0),
);

// ========== Theme Data ==========
final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: darkColorScheme.background,
  appBarTheme: AppBarTheme(
    backgroundColor: darkColorScheme.surface,
    foregroundColor: darkColorScheme.onSurface,
    elevation: 1,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: darkColorScheme.onSurface,
    ),
  ),
  cardTheme: CardThemeData(
    clipBehavior: Clip.antiAlias,
    color: darkColorScheme.surfaceVariant,
    shadowColor: darkColorScheme.shadow,
    elevation: 1,
    margin: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    surfaceTintColor: Colors.transparent,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: darkColorScheme.primary,
    foregroundColor: darkColorScheme.onPrimary,
    elevation: 4,
  ),
);

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: lightColorScheme.background,
  appBarTheme: AppBarTheme(
    backgroundColor: lightColorScheme.surface,
    foregroundColor: lightColorScheme.onSurface,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: lightColorScheme.onSurface,
    ),
  ),
  cardTheme: CardThemeData(
    clipBehavior: Clip.antiAlias,
    color: lightColorScheme.surface,
    shadowColor: lightColorScheme.shadow,
    elevation: 0,
    margin: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: BorderSide(
        color: lightColorScheme.outline.withOpacity(0.2),
        width: 1,
      ),
    ),
    surfaceTintColor: Colors.transparent,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: lightColorScheme.primary,
    foregroundColor: lightColorScheme.onPrimary,
    elevation: 2,
  ),
);
