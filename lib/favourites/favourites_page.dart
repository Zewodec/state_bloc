import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:state_bloc/favourites/cubit/favourites_anime_cubit.dart';

class FavouritesPage extends StatefulWidget {
  FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  late FavouritesAnimeCubit favouritesAnimeCubit;

  @override
  void initState() {
    favouritesAnimeCubit = BlocProvider.of<FavouritesAnimeCubit>(context);
    favouritesAnimeCubit.loadFavourites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: BlocBuilder<FavouritesAnimeCubit, FavouritesAnimeState>(
        bloc: favouritesAnimeCubit,
        builder: (context, state) {
          if (state is FavouritesAnimeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FavouritesAnimeSuccess) {
            return ListView.builder(
              itemCount: state.favourites.length,
              itemBuilder: (context, index) {
                final anime = state.favourites[index];
                return ListTile(
                  title: Text(anime.title ?? ''),
                  subtitle: Text(anime.synopsis ?? ''),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      bool isAdded =
                          favouritesAnimeCubit.addRemoveFavourite(state.favourites[index]);
                      Fluttertoast.showToast(
                          msg: isAdded ? "Added to favourites" : "Removed from favourites",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No favourites'),
            );
          }
        },
      ),
    );
  }
}
