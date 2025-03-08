// ignore_for_file: avoid_classes_with_only_static_members

abstract final class Endpoints {
  static const baseUrl = "https://caseapi.nodelabs.dev/";

  static const login = "${baseUrl}user/login";
  static const register = "${baseUrl}user/register";
  static const profile = "${baseUrl}user/profile";
  static const upload_photo = "${baseUrl}user/upload_photo";
  static const movies = "${baseUrl}movie/list";
  static const favorites = "${baseUrl}movie/favorites";

  static String favoriteMovie(String id) => "${baseUrl}movie/favorite/$id";
}
