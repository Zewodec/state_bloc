import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:state_bloc/favourites/cubit/favourites_anime_cubit.dart';

import 'anime_search/anime_detailed_page.dart';
import 'anime_search/bloc/anime_search_cubit.dart';
import 'anime_search/model/AnimeSearchModel.dart';
import 'favourites/favourites_page.dart';

void main() {
  final favouritesAnimeCubit = FavouritesAnimeCubit();
  GetIt.I.registerSingleton<FavouritesAnimeCubit>(favouritesAnimeCubit);
  runApp(BlocProvider(
      create: (BuildContext context) {
        return favouritesAnimeCubit;
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _searchTextController;
  late AnimeSearchCubit _animeSearchCubit;
  late FavouritesAnimeCubit _favouritesAnimeCubit;

  @override
  void initState() {
    _searchTextController = TextEditingController();
    _animeSearchCubit = AnimeSearchCubit();
    _animeSearchCubit.getAnimeSearch('', 20);
    _favouritesAnimeCubit = GetIt.I<FavouritesAnimeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Anime App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => _favouritesAnimeCubit,
                    child: FavouritesPage(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                SearchBar(
                  controller: _searchTextController,
                  onSubmitted: (text) {
                    _animeSearchCubit.getAnimeSearch(_searchTextController.text, 20);
                  },
                ),
                const SizedBox(height: 24),
                BlocConsumer(
                  bloc: _animeSearchCubit,
                  builder: (context, state) {
                    if (state is AnimeSearchInitial) {
                      return const Text('Search for an anime');
                    } else if (state is AnimeSearchLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is AnimeSearchSuccess) {
                      return GridView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.8),
                        itemCount: state.animesModel.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return AnimeCard(state.animesModel.data?[index]);
                        },
                      );
                    } else if (state is AnimeSearchError) {
                      return Text(state.message);
                    } else {
                      return const Text('Search for an anime');
                    }
                  },
                  listener: (context, state) {
                    if (state is AnimeSearchError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimeCard extends StatelessWidget {
  final Datum? data;

  const AnimeCard(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.orangeAccent.withOpacity(0.1)),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AnimeDetailsPage(anime: data!)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 90,
              child: CachedNetworkImage(
                imageUrl: data!.images?['jpg']?.imageUrl ?? '',
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              data?.title ?? '',
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: -0.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              data?.titleJapanese ?? '',
              style: const TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
