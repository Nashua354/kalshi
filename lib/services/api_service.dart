import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final Map<String, String> _defaultHeaders = {
    "accept": "application/json",
    "content-type": "application/json"
  };
  Future get(String url, {Map<String, String>? headers}) async {
    _defaultHeaders.addAll(headers ?? {});
    print("Request Data");
    print(url);
    print(_defaultHeaders);
    http.Response response =
        await http.get(Uri.parse(url), headers: _defaultHeaders);
    print("Response");
    print(response.body);
    print(response.statusCode);
    return response.body;
  }

  Future post(String url, {Map<String, String>? headers, body}) async {
    _defaultHeaders.addAll(headers ?? {});
    print("Request Data");
    print(url);
    print(_defaultHeaders);
    print(body);
    http.Response response = await http.post(Uri.parse(url),
        headers: _defaultHeaders, body: json.encode(body));
    print("Response");
    print(response.body);
    print(response.statusCode);

    return response.body;
  }
}
