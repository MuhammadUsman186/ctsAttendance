abstract class BaseApiService {
  final String baseUrl = "http://20.203.100.210/api/";

  // /Staging
  // final String baseUrl = "http://20.203.100.211/api/";

  Future<dynamic> getResponse(String url, String token);

  Future<dynamic> postResponse(
      String url, Map<String, dynamic> parameters, String token);

  Future<dynamic> putResponse(
      String url, Map<String, dynamic> parameters, String token);
}
