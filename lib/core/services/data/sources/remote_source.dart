abstract class RemoteSource {
  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, dynamic> queryParam,
  });
}
