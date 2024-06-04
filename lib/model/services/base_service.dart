abstract class BaseService{
  final String baseURL = "";

  Future<dynamic> getResponse(String url);
}