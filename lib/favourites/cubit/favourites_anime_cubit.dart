import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../anime_search/model/AnimeSearchModel.dart';

part 'favourites_anime_state.dart';

class FavouritesAnimeCubit extends Cubit<FavouritesAnimeState> {
  FavouritesAnimeCubit() : super(FavouritesAnimeInitial());

  List<Datum> favourites = <Datum>[];

  void loadFavourites() {
    emit(FavouritesAnimeLoading());
    Future.delayed(const Duration(seconds: 1))
        .then((value) => emit(FavouritesAnimeSuccess(favourites)));
  }

  bool addRemoveFavourite(Datum anime) {
    if (favourites.contains(anime)) {
      favourites.removeWhere((element) => element.malId == anime.malId);
      return false;
    } else {
      favourites.add(anime);
      return true;
    }
  }
}
