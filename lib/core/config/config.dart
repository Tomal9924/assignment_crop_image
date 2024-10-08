import 'package:memes_life/features/memes/presentation/bloc/read_bloc/read_bloc.dart';

import '../shared/shared.dart';
//! mason:linking-imports - DO NOT REMOVE THIS COMMENT --------------------------->
import '../../features/meme_details/meme_details.dart';
import '../../features/memes/memes.dart';

part 'dependencies.dart';
part 'network_certificates.dart';
//! mason:linking-dependencies - DO NOT REMOVE THIS COMMENT ---------------------->
part 'dependencies/meme_details.dart';
part 'dependencies/memes.dart';

class AppConfig {
  static FutureOr<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    // Bypass the SSL certificate verification
    HttpOverrides.global = MyHttpOverrides();

    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationCacheDirectory(),
    );

    // Initialize the configurations
    await _setupDependencies();
  }

  static ThemeData themeData({
    required BuildContext context,
    required ThemeMode mode,
  }) {
    final ThemeScheme theme =
        mode == ThemeMode.dark ? ThemeScheme.light() : ThemeScheme.dark();
    return ThemeData(
      brightness: Brightness.dark,
      canvasColor: theme.backgroundPrimary,
      scaffoldBackgroundColor: theme.backgroundPrimary,
      splashFactory: InkRipple.splashFactory,
      primaryColor: theme.primary,
      indicatorColor: theme.primary,
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        filled: true,
        fillColor: theme.backgroundSecondary,
        labelStyle: TextStyles.body(context: context, color: theme.textPrimary),
        contentPadding: const EdgeInsets.all(16.0),
        hintStyle:
            TextStyles.body(context: context, color: theme.textSecondary),
        errorStyle: const TextStyle(height: 0),
        helperStyle: const TextStyle(height: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: theme.backgroundTertiary,
            width: .25,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: theme.backgroundTertiary,
            width: .25,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: theme.backgroundTertiary,
            width: .25,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: theme.textSecondary,
            width: .25,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: theme.negative,
            width: .15,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: theme.negative,
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: theme.primary.withAlpha(150),
              width: 4,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          elevation: 3,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: theme.backgroundPrimary),
      iconTheme: IconThemeData(color: theme.textPrimary, size: 20),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      dividerTheme:
          DividerThemeData(color: theme.backgroundTertiary, thickness: .25),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: theme.textPrimary),
        titleSpacing: 0,
        actionsIconTheme: IconThemeData(color: theme.textPrimary),
        backgroundColor: theme.backgroundSecondary,
        surfaceTintColor: theme.backgroundSecondary,
        foregroundColor: theme.backgroundPrimary,
        elevation: 0,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: theme.primary,
        primary: theme.primary,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    );
  }
}
