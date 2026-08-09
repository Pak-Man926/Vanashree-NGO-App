import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: "Manrope",
      useMaterial3: true,
      colorScheme: AppColors.lightColorScheme,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      canvasColor: AppColors.lightSurface,
      cardColor: AppColors.lightSurface,

      // App Bar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightBackground,
        elevation: 0,
        scrolledUnderElevation: 4,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.lightPrimary),
        titleTextStyle: TextStyle(
          color: AppColors.lightText,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),

      // Text Theme
      textTheme: AppTextStyles.textTheme(AppColors.lightColorScheme),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.inputFill,
        hintStyle: const TextStyle(color: AppColors.lightHint, fontSize: 14),
        labelStyle: const TextStyle(
          color: AppColors.lightPrimary,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.lightPrimary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.lightError),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.lightError, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFE8D5C4)),
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightPrimary,
          foregroundColor: AppColors.lightSurface,
          minimumSize: const Size(double.infinity, 56), // Full width buttons
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.lightPrimary,
          side: const BorderSide(color: AppColors.lightPrimary, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.lightPrimary,
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),

      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected))
            return AppColors.lightPrimary;
          return AppColors.lightHint;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.lightPrimary.withValues(alpha: 0.5);
          }
          return AppColors.lightBorder;
        }),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: AppColors.lightSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),

      // Icon Theme
      iconTheme: const IconThemeData(color: AppColors.lightOnSurface, size: 24),

      // Snack Bar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.lightOnSurface,
        contentTextStyle: const TextStyle(
          color: AppColors.lightBackground,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 6,
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.lightSurface,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titleTextStyle: const TextStyle(
          color: AppColors.lightOnSurface,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        contentTextStyle: const TextStyle(
          color: AppColors.lightOnSurface,
          fontSize: 14,
        ),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.lightSurface,
        disabledColor: const Color(0xFFEBE1D9),
        selectedColor: AppColors.lightPrimary,
        secondarySelectedColor: AppColors.lightComplement,
        side: const BorderSide(color: AppColors.lightBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        labelStyle: const TextStyle(color: AppColors.lightOnSurface),
        secondaryLabelStyle: const TextStyle(color: AppColors.lightOnPrimary),
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.lightSurface,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        surfaceTintColor: AppColors.lightPrimary,
      ),

      // Drawer Theme
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.lightSurface,
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(16)),
        ),
      ),

      // Menu Theme
      menuTheme: MenuThemeData(
        style: MenuStyle(
          backgroundColor: const WidgetStatePropertyAll(AppColors.lightSurface),
          elevation: const WidgetStatePropertyAll(8),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),

      // Menu Button Highlight Color
      menuButtonTheme: MenuButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return AppColors.lightPrimary.withValues(alpha: 0.1);
            }
            return Colors.transparent;
          }),
          overlayColor: WidgetStatePropertyAll(
            AppColors.lightPrimary.withValues(alpha: 0.1),
          ),
        ),
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.lightPrimary,
        linearTrackColor: AppColors.lightBorder,
        linearMinHeight: 4,
        refreshBackgroundColor: AppColors.lightSurface,
      ),

      // Slider Theme
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.lightPrimary,
        inactiveTrackColor: AppColors.lightBorder,
        thumbColor: AppColors.lightPrimary,
        overlayColor: AppColors.lightPrimary.withValues(alpha: 0.2),
        valueIndicatorColor: AppColors.lightPrimary,
        valueIndicatorTextStyle: const TextStyle(
          color: AppColors.lightOnPrimary,
        ),
      ),

      // Tab Bar Theme
      tabBarTheme: const TabBarThemeData(
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: AppColors.lightPrimary, width: 3),
        ),
        labelColor: AppColors.lightPrimary,
        unselectedLabelColor: AppColors.lightHint,
        labelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
      ),

      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected))
            return AppColors.lightPrimary;
          return Colors.transparent;
        }),
        checkColor: const WidgetStatePropertyAll(AppColors.lightOnPrimary),
        side: const BorderSide(color: AppColors.lightPrimary),
        //  const BorderSide(color: AppColors.lightBorder);
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),

      // Radio Theme
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected))
            return AppColors.lightPrimary;
          return Colors.transparent;
        }),
        overlayColor: WidgetStatePropertyAll(
          AppColors.lightPrimary.withValues(alpha: 0.2),
        ),
      ),

      // Tooltip Theme
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.lightOnSurface,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          color: AppColors.lightBackground,
          fontWeight: FontWeight.w500,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),

      // List Tile Theme
      listTileTheme: ListTileThemeData(
        tileColor: AppColors.lightSurface,
        selectedTileColor: AppColors.lightPrimary.withValues(alpha: 0.1),
        textColor: AppColors.lightOnSurface,
        titleTextStyle: const TextStyle(
          color: AppColors.lightOnSurface,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        subtitleTextStyle: const TextStyle(
          color: AppColors.lightHint,
          fontSize: 14,
        ),
        leadingAndTrailingTextStyle: const TextStyle(
          color: AppColors.lightHint,
          fontSize: 12,
        ),
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.lightPrimary,
        foregroundColor: AppColors.lightOnPrimary,
        elevation: 6,
        hoverElevation: 8,
        focusElevation: 6,
        highlightElevation: 12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      // Popup Menu Theme
      popupMenuTheme: PopupMenuThemeData(
        color: AppColors.lightSurface,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(color: AppColors.lightOnSurface),
      ),

      // Search Bar Theme
      searchBarTheme: SearchBarThemeData(
        backgroundColor: const WidgetStatePropertyAll(AppColors.lightSurface),
        elevation: const WidgetStatePropertyAll(0),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        side: const WidgetStatePropertyAll(
          BorderSide(color: AppColors.lightBorder),
        ),
        hintStyle: const WidgetStatePropertyAll(
          TextStyle(color: AppColors.lightHint, fontSize: 14),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: "Manrope",
      useMaterial3: true,
      colorScheme: AppColors.darkColorScheme,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      canvasColor: AppColors.darkSurface,
      cardColor: AppColors.darkSurface,

      // App Bar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1B3229),
        foregroundColor: AppColors.darkOnSurface,
        elevation: 0,
        scrolledUnderElevation: 4,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.darkOnSurface),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.darkOnSurface,
        ),
      ),

      // Text Theme
      textTheme: AppTextStyles.textTheme(AppColors.darkColorScheme),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1B3229),
        hintStyle: const TextStyle(color: AppColors.darkHint, fontSize: 14),
        labelStyle: const TextStyle(color: AppColors.darkPrimary, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.darkBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.darkBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.darkPrimary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.darkError),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.darkError, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF2A4138)),
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkPrimary,
          foregroundColor: AppColors.darkOnPrimary,
          minimumSize: const Size(double.infinity, 56), // Full width buttons
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.darkPrimary,
          side: const BorderSide(color: AppColors.darkPrimary, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.darkPrimary,
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),

      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected))
            return AppColors.darkPrimary;
          return const Color(0xFF5A6B60);
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.darkPrimary.withValues(alpha: 0.5);
          }
          return AppColors.darkBorder;
        }),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: AppColors.darkSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),

      // Icon Theme
      iconTheme: const IconThemeData(color: AppColors.darkOnSurface, size: 24),

      // Snack Bar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: const Color(0xFF1B3229),
        contentTextStyle: const TextStyle(
          color: AppColors.darkOnSurface,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 6,
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.darkSurface,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titleTextStyle: const TextStyle(
          color: AppColors.darkOnSurface,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        contentTextStyle: const TextStyle(
          color: AppColors.darkOnSurface,
          fontSize: 14,
        ),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.darkSurface,
        disabledColor: const Color(0xFF2A4138),
        selectedColor: AppColors.darkPrimary,
        secondarySelectedColor: const Color(0xFF99CBA1),
        side: const BorderSide(color: AppColors.darkBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        labelStyle: const TextStyle(color: AppColors.darkOnSurface),
        secondaryLabelStyle: const TextStyle(color: AppColors.darkOnPrimary),
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.darkSurface,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        surfaceTintColor: AppColors.darkPrimary,
      ),

      // Drawer Theme
      drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.darkSurface,
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(16)),
        ),
      ),

      // Menu Theme
      menuTheme: MenuThemeData(
        style: MenuStyle(
          backgroundColor: const WidgetStatePropertyAll(AppColors.darkSurface),
          elevation: const WidgetStatePropertyAll(8),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),

      // Menu Button Highlight Color
      menuButtonTheme: MenuButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return AppColors.darkPrimary.withValues(alpha: 0.2);
            }
            return Colors.transparent;
          }),
          overlayColor: WidgetStatePropertyAll(
            AppColors.darkPrimary.withValues(alpha: 0.2),
          ),
        ),
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.darkPrimary,
        linearTrackColor: AppColors.darkBorder,
        linearMinHeight: 4,
        refreshBackgroundColor: AppColors.darkSurface,
      ),

      // Slider Theme
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.darkPrimary,
        inactiveTrackColor: AppColors.darkBorder,
        thumbColor: AppColors.darkPrimary,
        overlayColor: AppColors.darkPrimary.withValues(alpha: 0.3),
        valueIndicatorColor: AppColors.darkPrimary,
        valueIndicatorTextStyle: const TextStyle(
          color: AppColors.darkOnPrimary,
        ),
      ),

      // Tab Bar Theme
      tabBarTheme: const TabBarThemeData(
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: AppColors.darkPrimary, width: 3),
        ),
        labelColor: AppColors.darkPrimary,
        unselectedLabelColor: AppColors.darkHint,
        labelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
      ),

      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected))
            return AppColors.darkPrimary;
          return Colors.transparent;
        }),
        checkColor: const WidgetStatePropertyAll(AppColors.darkOnPrimary),
        side: const BorderSide(color: AppColors.darkPrimary),
        //  const BorderSide(color: AppColors.darkBorder);
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),

      // Radio Theme
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected))
            return AppColors.darkPrimary;
          return Colors.transparent;
        }),
        overlayColor: WidgetStatePropertyAll(
          AppColors.darkPrimary.withValues(alpha: 0.3),
        ),
      ),

      // Tooltip Theme
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: const Color(0xFF1B3229),
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          color: AppColors.darkOnSurface,
          fontWeight: FontWeight.w500,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),

      // List Tile Theme
      listTileTheme: ListTileThemeData(
        tileColor: AppColors.darkSurface,
        selectedTileColor: AppColors.darkPrimary.withValues(alpha: 0.2),
        textColor: AppColors.darkOnSurface,
        titleTextStyle: const TextStyle(
          color: AppColors.darkOnSurface,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        subtitleTextStyle: const TextStyle(
          color: AppColors.darkHint,
          fontSize: 14,
        ),
        leadingAndTrailingTextStyle: const TextStyle(
          color: AppColors.darkHint,
          fontSize: 12,
        ),
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.darkPrimary,
        foregroundColor: AppColors.darkOnPrimary,
        elevation: 6,
        hoverElevation: 8,
        focusElevation: 6,
        highlightElevation: 12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      // Popup Menu Theme
      popupMenuTheme: PopupMenuThemeData(
        color: AppColors.darkSurface,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(color: AppColors.darkOnSurface),
      ),

      // Search Bar Theme
      searchBarTheme: SearchBarThemeData(
        backgroundColor: const WidgetStatePropertyAll(Color(0xFF1B3229)),
        elevation: const WidgetStatePropertyAll(0),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        side: const WidgetStatePropertyAll(
          BorderSide(color: AppColors.darkBorder),
        ),
        hintStyle: const WidgetStatePropertyAll(
          TextStyle(color: AppColors.darkHint, fontSize: 14),
        ),
      ),
    );
  }
}
