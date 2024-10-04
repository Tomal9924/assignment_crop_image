class ApiConstants {
  static const String _baseUrl = "https://api.imgflip.com/";
  static const String fetch = 'get_memes';
  static Uri url({required String api}) => Uri.parse("$_baseUrl$api");
}
