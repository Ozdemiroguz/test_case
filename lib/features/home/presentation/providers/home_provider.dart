import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_case/features/home/presentation/states/home_state.dart';
import 'package:test_case/core/injections/locator.dart';

// HomeNotifier provider'ı
final homeProvider =
    NotifierProvider<_HomeNotifier, HomeState>(_HomeNotifier.new);

final class _HomeNotifier extends Notifier<HomeState> {
  @override
  HomeState build() {
    // Build aşamasında asenkron initial load başlatılır.
    Future(() => init());
    return HomeState.initial();
  }

  Future<void> init() async {
    setLoading(true);
    // İlk sayfa ve favori filmleri yüklüyoruz.
    await loadInitialMovies();
    await loadFavoriteMovies();
    updateFavoriteMovies();
    setLoading(false);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setLoadingMore(bool isLoadingMore) {
    state = state.copyWith(isLoadingMore: isLoadingMore);
  }

  void setCurrentIndex(int index) {
    state = state.copyWith(currenIndex: index);

    //eğerki index uzunluktan 1 küçükse veri çekişini başlat
    if (index == state.paginatedMoviesResponse.movies.length - 2) {
      loadMoreMovies();
    }
  }

  void onChangedLongDescription(bool longDescription) {
    state = state.copyWith(longDescription: longDescription);
  }

  /// İlk sayfa (veya refresh) işlemini yükler.
  Future<void> loadInitialMovies() async {
    final result = await ref.read(movieRepositoryProvider).getPaginatedMovies(
          page: 1,
        );
    result.match(
      (failure) => state = state.copyWith(failure: some(failure)),
      (paginatedResponse) {
        // Gelen yanıtın currentPage ve totalPages değerleri state'e aktarılır.
        state = state.copyWith(
          paginatedMoviesResponse: paginatedResponse,
          failure: none(),
        );
      },
    );
  }

  /// "Load more" işlemini gerçekleştirir; mevcut sayfa state içerisindeki currentPage,
  /// toplam sayfa state içerisindeki totalPages ile kontrol edilir.
  Future<void> loadMoreMovies() async {
    final currentPage = state.paginatedMoviesResponse.currentPage;
    final totalPages = state.paginatedMoviesResponse.totalPages;
    if (currentPage >= totalPages)
      return; // Son sayfaya ulaşılmışsa, yeni veri yok.
    setLoadingMore(true);
    final nextPage = currentPage + 1;
    final result = await ref.read(movieRepositoryProvider).getPaginatedMovies(
          page: nextPage,
        );
    result.match(
      (failure) {
        state = state.copyWith(failure: some(failure));
      },
      (paginatedResponse) {
        // Mevcut filmleri güncelleyip, yeni sayfa filmlerini ekliyoruz.
        final updatedMovies = [
          ...state.paginatedMoviesResponse.movies,
          ...paginatedResponse.movies
        ];
        final updatedResponse = state.paginatedMoviesResponse.copyWith(
          movies: updatedMovies,
          currentPage: paginatedResponse.currentPage,
          totalPages: paginatedResponse.totalPages,
        );
        state = state.copyWith(
          paginatedMoviesResponse: updatedResponse,
          failure: none(),
        );
      },
    );
    setLoadingMore(false);
  }

  /// Kullanıcının favori filmler listesini yükler.
  Future<void> loadFavoriteMovies() async {
    final result = await ref.read(movieRepositoryProvider).getFavoriteMovies();
    result.match(
      (failure) => state = state.copyWith(failure: some(failure)),
      (favorites) => state = state.copyWith(
        favoriteMovies: favorites,
        failure: none(),
      ),
    );
  }

  //index kontrolü yap ve duruma göre veriyi güncelle

  /// Belirli bir filmin favori durumunu tersine çevirir (toggle) ve favori listesini günceller.
  Future<void> toggleFavorite(String movieId) async {
    final result =
        await ref.read(movieRepositoryProvider).toggleFavorite(movieId);

    result.match
        // Hata durumunda, hata state'e aktarılır.
        (() async {
      //hata olmayan durum
      await loadFavoriteMovies();
      updateFavoriteMovies();
    },
            // Başarılı durumda, favori filmler listesi güncellenir.
            (failure) {
      state = state.copyWith(failure: some(failure));
    });
  }

  void updateFavoriteMovies() {
    //stattki favorilerle normal filmleri karşılaştırıp favori olanları güncelle
    final updatedMovies = state.paginatedMoviesResponse.movies.map((movie) {
      final isFavorite =
          state.favoriteMovies.any((favorite) => favorite.id == movie.id);
      return movie.copyWith(isFavorite: isFavorite);
    }).toList();

    final updatedResponse = state.paginatedMoviesResponse.copyWith(
      movies: updatedMovies,
    );

    state = state.copyWith(
      paginatedMoviesResponse: updatedResponse,
    );
  }
}
