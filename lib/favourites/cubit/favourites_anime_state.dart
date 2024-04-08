part of 'favourites_anime_cubit.dart';

@immutable
sealed class FavouritesAnimeState {}

final class FavouritesAnimeInitial extends FavouritesAnimeState {}

final class FavouritesAnimeLoading extends FavouritesAnimeState {}

final class FavouritesAnimeSuccess extends FavouritesAnimeState {
  final List<Datum> favourites;

  FavouritesAnimeSuccess(this.favourites);
}
