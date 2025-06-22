class GetMovieListParams {
  final MovieListCategory category;
  final int page;

  GetMovieListParams({required this.category, this.page = 1});
}

enum MovieListCategory { nowPlaying, upcoming }
