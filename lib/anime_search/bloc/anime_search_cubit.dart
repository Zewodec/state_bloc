import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:state_bloc/anime_search/model/AnimeSearchModel.dart';

part 'anime_search_state.dart';

class AnimeSearchCubit extends Cubit<AnimeSearchState> {
  AnimeSearchCubit() : super(AnimeSearchInitial());

  Dio dio = Dio();

  static const String baseAnimeUrl = 'https://api.jikan.moe/v4/anime';

  void getAnimeSearch(String query, int limit) async {
    emit(AnimeSearchLoading());
    try {
      final response =
          await dio.get('$baseAnimeUrl?limit=$limit&order_by=popularity&sort=desc&q=$query');
      final animesModel = AnimeSearchModel.fromJson(response.data);
      emit(AnimeSearchSuccess(animesModel));
    } catch (e) {
      emit(AnimeSearchError(e.toString()));
    }
  }
}
