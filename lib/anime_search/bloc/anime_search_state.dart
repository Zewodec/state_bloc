part of 'anime_search_cubit.dart';

@immutable
sealed class AnimeSearchState {}

final class AnimeSearchInitial extends AnimeSearchState {}

final class AnimeSearchLoading extends AnimeSearchState {}

final class AnimeSearchSuccess extends AnimeSearchState {
  final AnimeSearchModel animesModel;

  AnimeSearchSuccess(this.animesModel);
}

final class AnimeSearchError extends AnimeSearchState {
  final String message;

  AnimeSearchError(this.message);
}
