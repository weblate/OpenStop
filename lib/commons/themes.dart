import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Default {
  static const Color primary = Color(0xFFEC7C72);

  // Foreground Selected (FloatingAction)Button / Account Background, Border, Text
  static Color onPrimary = Colors.grey.shade100;

  // Background Unselected FloatingActionButton
  static Color primaryContainerLight = Colors.grey.shade100;
  static const Color primaryContainerDark = Color(0xFF002020);

  // Foreground Unselected (FloatingAction)Button
  static Color onPrimaryContainerLight = Colors.grey.shade900;
  static Color onPrimaryContainerDark = Colors.grey.shade50;

  // Mixed with Background Header Scaffold when scrolled / Transparent so no color change is visible
  static const Color surfaceTint = Colors.transparent;

  // Background Header Scaffold / Background Body Drawer (default)
  static const Color surface = Color(0xFFEC7C72);

  // Background Body Scaffold, Background QuestionDialog, Background Body Drawer, Background Map
  static Color backgroundLight = Colors.grey.shade100;
  static const Color backgroundDark = Color(0xFF002020);

  // Foreground QuestionDialog (Border, Lines)
  static Color onBackgroundLight = Colors.grey.shade300;
  static const Color onBackgroundDark = Color(0xFF003144);

  // Shadow for Material Widgets (Zoom button, Loading indicator)
  static const shadow = Colors.black;

  // Unselected Switch Track
  static Color surfaceVariantLight = Colors.grey.shade300;
  static Color surfaceVariantDark = Colors.grey.shade800;

  // Unselected Switch Outline
  static Color outline = Colors.grey.shade500;

  // Divider
  static Color outlineVariant = Colors.grey.shade600.withOpacity(0.2);

  static const double borderRadius = 12.0;
  static const double padding = 12.0;
  static const double elevation = 4.0;
}

// Default theme for all common theme settings
final ThemeData defaultTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    elevation: Default.elevation,
    shadowColor: Default.shadow,
    foregroundColor: Default.onPrimary,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemStatusBarContrastEnforced: false,
      systemNavigationBarColor: Colors.black26,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarContrastEnforced: false,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    smallSizeConstraints: BoxConstraints.tight(const Size.square(48)),
    largeSizeConstraints: BoxConstraints.tight(const Size.square(70)),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(Default.borderRadius)
      )
    ),
    elevation: Default.elevation
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.transparent,
      minimumSize: const Size.square(48),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Default.borderRadius),
      ),
      side: const BorderSide(
        color: Default.primary
      )
    )
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Default.borderRadius),
        )
      )
    )
  ),
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: Default.padding),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(Default.borderRadius)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(Default.borderRadius)),
      borderSide: BorderSide(
        color: Default.primary
      )
    )
  ),
  snackBarTheme: SnackBarThemeData(
    actionTextColor: Default.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Default.borderRadius)
    )
  )
);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ThemeData.light().colorScheme.copyWith(
    primary: Default.primary,
    onPrimary: Default.onPrimary,
    primaryContainer: Default.primaryContainerLight,
    onPrimaryContainer: Default.onPrimaryContainerLight,
    surface: Default.surface,
    surfaceVariant: Default.surfaceVariantLight,
    background: Default.backgroundLight,
    onBackground: Default.onBackgroundLight,
    tertiary: Colors.white,
    onTertiary: Colors.black,
    shadow: Default.shadow,
    surfaceTint: Default.surfaceTint,
    outline: Default.outline,
    outlineVariant: Default.outlineVariant,
  ),
  appBarTheme: defaultTheme.appBarTheme,
  floatingActionButtonTheme: defaultTheme.floatingActionButtonTheme,
  outlinedButtonTheme: defaultTheme.outlinedButtonTheme,
  iconButtonTheme: defaultTheme.iconButtonTheme,
  inputDecorationTheme: defaultTheme.inputDecorationTheme.copyWith(
    border: defaultTheme.inputDecorationTheme.border!,
    enabledBorder: defaultTheme.inputDecorationTheme.border!.copyWith(
      borderSide: defaultTheme.inputDecorationTheme.border!.borderSide.copyWith(
        color: Default.onBackgroundLight
      )
    )
  ),
  snackBarTheme: defaultTheme.snackBarTheme.copyWith(
    backgroundColor: Colors.grey.shade900,
  ),
  // To have the same background color for licenses as for every other scaffold
  cardColor: Default.backgroundLight,
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ThemeData.dark().colorScheme.copyWith(
    primary: Default.primary,
    onPrimary: Default.onPrimary,
    primaryContainer: Default.primaryContainerDark,
    onPrimaryContainer: Default.onPrimaryContainerDark,
    surface: Default.surface,
    surfaceVariant: Default.surfaceVariantDark,
    background: Default.backgroundDark,
    onBackground: Default.onBackgroundDark,
    tertiary: Colors.black,
    onTertiary: Colors.white,
    shadow: Default.shadow,
    surfaceTint: Default.surfaceTint,
    outline: Default.outline,
    outlineVariant: Default.outlineVariant,
  ),
  appBarTheme: defaultTheme.appBarTheme,
  floatingActionButtonTheme: defaultTheme.floatingActionButtonTheme,
  outlinedButtonTheme: defaultTheme.outlinedButtonTheme,
  iconButtonTheme: defaultTheme.iconButtonTheme,
  inputDecorationTheme: defaultTheme.inputDecorationTheme.copyWith(
    border: defaultTheme.inputDecorationTheme.border!,
    enabledBorder: defaultTheme.inputDecorationTheme.border!.copyWith(
      borderSide: defaultTheme.inputDecorationTheme.border!.borderSide.copyWith(
        color: Default.onBackgroundDark
      )
    )
  ),
  snackBarTheme: defaultTheme.snackBarTheme,
  // To have the same background color for licenses as for every other scaffold
  cardColor: Default.backgroundDark,
);

final ThemeData highContrastDarkTheme = ThemeData.dark().copyWith(
  colorScheme: const ColorScheme.highContrastDark(),
  floatingActionButtonTheme: defaultTheme.floatingActionButtonTheme,
  outlinedButtonTheme: defaultTheme.outlinedButtonTheme,
  iconButtonTheme: defaultTheme.iconButtonTheme,
  inputDecorationTheme: defaultTheme.inputDecorationTheme
);

final ThemeData highContrastLightTheme = ThemeData.light().copyWith(
  colorScheme: const ColorScheme.highContrastLight(),
  floatingActionButtonTheme: defaultTheme.floatingActionButtonTheme,
  outlinedButtonTheme: defaultTheme.outlinedButtonTheme,
  iconButtonTheme: defaultTheme.iconButtonTheme,
  inputDecorationTheme: defaultTheme.inputDecorationTheme
);
