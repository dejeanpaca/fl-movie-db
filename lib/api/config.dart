class ApiConfig {
  static String apiEndpoint = 'https://api.themoviedb.org/3/';
  static String posterEndpoint = 'https://image.tmdb.org/t/p/w500';

  static String authorization =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOGQ3Zjc2OTQ3OTA0YTAxMTI4NmRjNzMyYzU1MjM0ZSIsInN1YiI6IjYwMzM3ODBiMTEzODZjMDAzZjk0ZmM2YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XYuIrLxvowrkevwKx-KhOiOGZ2Tn-R8tEksXq842kX4';

  /// create an url for a given backdrop image
  static String getBackdropUrl(String backdrop) {
    return '$posterEndpoint$backdrop';
  }

  /// create an url for a given poster image
  static String getPosterUrl(String poster) {
    return '$posterEndpoint$poster';
  }
}
