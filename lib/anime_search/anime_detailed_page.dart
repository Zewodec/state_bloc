import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

import '../favourites/cubit/favourites_anime_cubit.dart';
import 'model/AnimeSearchModel.dart';

class AnimeDetailsPage extends StatelessWidget {
  final Datum anime;

  const AnimeDetailsPage({Key? key, required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            // pinned: true,
            flexibleSpace: CachedNetworkImage(
              imageUrl: anime.images!.values.first.imageUrl ?? '',
              height: 300,
              fit: BoxFit.fitHeight,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          bool isAdded = GetIt.I<FavouritesAnimeCubit>().addRemoveFavourite(anime);
                          Fluttertoast.showToast(
                              msg: isAdded ? "Added to favourites" : "Removed from favourites",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        child: const Text('♥'),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      anime.title ?? '',
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Synopsis:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      anime.synopsis ?? '',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Type: ${anime.type ?? ''}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      'Episodes: ${anime.episodes ?? ''}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      'Status: ${anime.status ?? ''}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Score: ${anime.score ?? ''}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      'Popularity: ${anime.popularity ?? ''}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
