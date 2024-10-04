import 'package:memes_life/features/memes/presentation/bloc/read_bloc/read_bloc.dart';

import 'core/config/config.dart';
import 'core/shared/shared.dart';

void main() async {
  await AppConfig.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ThemeBloc>()),
        BlocProvider(create: (_) => sl<ReadBloc>()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => child!,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (_, state) {
          final theme = state.scheme;
          return MaterialApp.router(
            themeMode: state.mode,
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            theme: AppConfig.themeData(context: context, mode: ThemeMode.light),
            darkTheme:
                AppConfig.themeData(context: context, mode: ThemeMode.dark),
          );
        },
      ),
    );
  }
}
