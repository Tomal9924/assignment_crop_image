import '../../features/meme_details/meme_details.dart';
import '../../features/memes/memes.dart';
import 'shared.dart';

final router = GoRouter(
  initialLocation: HomeScreen.path,
  routes: [
    GoRoute(
      path: HomeScreen.path,
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: MemeDetailsPage.path,
      name: MemeDetailsPage.name,
      builder: (context, state) {
        final meme = state.extra as MemesEntity;
        return MemeDetailsPage(meme: meme);
      },
    ),
  ],
);
