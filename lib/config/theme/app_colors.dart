import 'package:flutter/material.dart';

/// AppColors defines the central color palette for the Vanashree NGO App.
///
/// 🎨 Palette Guidelines:
/// - The palette is centered around a stark dark green for primary actions,
///   offset by warm, off-white background tones.
class AppColors {
  AppColors._();

  // --- Light Mode Colors ---

  /// Primary Dark Green: #163A24
  /// Used for primary buttons, app bar icons, active bottom navigation items, and solid hero cards.
  static const Color lightPrimary = Color(0xFF163A24);

  /// Background Off-White: #F6F5F2
  /// The primary scaffold background color, giving a warm, organic feel.
  static const Color lightBackground = Color(0xFFF6F5F2);

  /// Surface White: #FFFFFF
  /// Used for floating cards, bottom navigation backgrounds, and list items.
  static const Color lightSurface = Color(0xFFFFFFFF);

  /// Input Fill Color: #EBEAE5
  /// A slightly darker beige used for text field backgrounds to differentiate from the scaffold.
  static const Color inputFill = Color(0xFFEBEAE5);

  /// Primary Text: #1A1A1A
  /// Near-black for high legibility on headings and primary body text.
  static const Color lightOnSurface = Color(0xFF1A1A1A);

  static const Color lightOnPrimary = Color(0xFFF4F5F1);
  static const Color lightBorder = Color(0xFFDAD8D1);

  /// Secondary Text: #757575
  /// Medium grey for labels, hints, and less important information.
  static const Color lightHint = Color(0xFF757575);

  static const Color lightError = Color(0xFFD32F2F);
  static const Color lightSuccess = Color(0xFF2E7D32);
  static const Color lightWarning = Color(0xFFF57C00);
  static const Color lightInfo = Color(0xFF1976D2);
  static const Color lightComplement = Color(0xFF5C7F64);

  /// Primary Text: #1A1A1A
  /// Near-black for high legibility on headings and primary body text.
  static const Color lightText = Color(0xFF1A1A1A);

  /// Secondary Text: #757575
  /// Medium grey for labels, hints, and less important information.
  static const Color lightMutedText = Color(0xFF757575);

  /// Accent/Tag Orange: #D97757
  /// Used for small "PENDING" tags in the dashboard.
  static const Color tagOrange = Color(0xFFD97757);

  // --- Dark Mode Colors ---
  static const Color darkBackground = Color(0xFF0F1D16);
  static const Color darkSurface = Color(0xFF15281F);
  static const Color darkPrimary = Color(0xFF7FBB84);
  static const Color darkOnPrimary = Color(0xFF0B2E1B);
  static const Color darkOnSurface = Color(0xFFE2E8DB);
  static const Color darkBorder = Color(0xFF2D4D38);
  static const Color darkHint = Color(0xFFA8B8A2);
  static const Color darkError = Color(0xFFEF5350);
  static const Color darkSuccess = Color(0xFF81C784);
  static const Color darkWarning = Color(0xFFFFB74D);
  static const Color darkInfo = Color(0xFF64B5F6);
  static const Color darkText = Color(0xFF5C2413);

  static final ColorScheme lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: lightPrimary,
    onPrimary: lightOnPrimary,
    secondary: lightComplement,
    onSecondary: lightOnSurface,
    tertiary: Color(0xFFBD3B3B),
    onTertiary: lightOnPrimary,
    error: lightError,
    onError: Color(0xFFFFFFFF),
    surface: lightSurface,
    onSurface: lightOnSurface,
    outline: lightBorder,
    outlineVariant: Color(0xFFCCC4BA),
    scrim: Colors.black,
    inverseSurface: darkOnSurface,
    inversePrimary: darkPrimary,
    surfaceDim: Color(0xFFF1E9E0),
    surfaceBright: lightSurface,
    tertiaryContainer: lightText,
    primaryFixed: lightMutedText,
  );

  static final ColorScheme darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: darkPrimary,
    onPrimary: darkOnPrimary,
    secondary: Color(0xFF99CBA1),
    onSecondary: darkOnPrimary,
    tertiary: Color(0xFFFFB4AE),
    onTertiary: Color(0xFF5C1515),
    error: darkError,
    onError: Color(0xFF000000),
    surface: darkSurface,
    onSurface: darkOnSurface,
    outline: darkBorder,
    outlineVariant: darkBorder,
    scrim: Colors.black,
    inverseSurface: lightBackground,
    inversePrimary: lightPrimary,
    surfaceDim: darkBackground,
    surfaceBright: Color(0xFF3D4C42),
  );
}
