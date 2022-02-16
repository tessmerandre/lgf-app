import 'package:http/http.dart' as http;

Future<http.Response> doGet(String url) async {
  return await http.get(Uri.parse(url));
}

