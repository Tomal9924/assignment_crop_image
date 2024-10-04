import 'package:memes_life/features/meme_details/presentation/pages/meme_details.dart';

import '../../../../core/shared/dimension.dart';
import '../../../../core/shared/shared.dart';
import '../../../memes/memes.dart';
import '../../../memes/presentation/bloc/read_bloc/read_bloc.dart';

class SearchPage extends StatelessWidget {
  static const name = "SearchPage";
  static const path = "/search-Page";

  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundPrimary,
          appBar: AppBar(
            backgroundColor: theme.backgroundPrimary,
            title: const Text("Search memes"),
            actions: [
              BlocBuilder<ReadBloc, ReadState>(
                builder: (context, state) {
                  if (state is ReadDone) {
                    return IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        showSearch(
                            context: context,
                            delegate: CustomSearchDelegate(memes: state.memes));
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
          body: const Center(
            child: Text("Press the search icon to search"),
          ),
        );
      },
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<MemesEntity> memes;
  CustomSearchDelegate({
    required this.memes,
  });
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search query
        },
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    List<MemesEntity> results = memes
        .where(
          (item) => item.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    return Container(
      decoration: BoxDecoration(
        color: context.read<ThemeBloc>().state.scheme.backgroundPrimary,
      ),
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(results[index].name),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<MemesEntity> suggestions = memes
        .where(
          (item) => item.name.toLowerCase().startsWith(query.toLowerCase()),
        )
        .toList();
    return BlocBuilder<ReadBloc, ReadState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: context.read<ThemeBloc>().state.scheme.backgroundPrimary,
          ),
          child: GridView.builder(
              itemCount: suggestions.length,
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              padding: EdgeInsets.all(Dimension.size.vertical.sixteen),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: Dimension.gridViewDimensions.maxCross,
                childAspectRatio: Dimension.gridViewDimensions.childAspectRatio,
                mainAxisSpacing: Dimension.gridViewDimensions.mainAxisSpacing,
                crossAxisSpacing: Dimension.gridViewDimensions.crossAxisSpacing,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  meme: suggestions[index],
                  onPress: () {
                    context.pushNamed(MemeDetailsPage.name,
                        extra: suggestions[index]);
                  },
                );
              }),
        );
      },
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Close the search
      },
    );
  }
}
