import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

enum HTTPMethod { get, post, patch, delete }

abstract class HTTPTask<T> {
  String? get endpointURL;

  HTTPMethod get method;

  dynamic get parameters;

  Map<String, String>? get additionalHeader;
}

class APIClient {
  Map<String, String> header = {'Content-Type': 'application/json'};

  String get baseUri => "http://localhost:3000";

  Future<dynamic> send(HTTPTask task) async {
    final url = _buildUrl(task);
    late http.Response response;

    _addHeader(task.additionalHeader ?? {});

    try {
      switch (task.method) {
        case HTTPMethod.get:
          response = await http.get(url, headers: header);
          break;

        case HTTPMethod.post:
          response = await http.post(url,
              headers: header, body: jsonEncode(task.parameters));
          break;

        case HTTPMethod.patch:
          response = await http.patch(url,
              headers: header, body: jsonEncode(task.parameters));
          break;

        case HTTPMethod.delete:
          response = await http.delete(url,
              headers: header, body: jsonEncode(task.parameters));
          break;

        default:
          throw UnimplementedError('Unsupported HTTP method');
      }
    } catch (e) {
      rethrow;
    }

    if (response.statusCode == 200) {
      try {
        return jsonDecode(response.body);
      } catch (e) {
        rethrow;
      }
    }

    throw Exception('Failed to fetch data');
  }

  Uri _buildUrl(HTTPTask task) {
    switch (task.method) {
      case HTTPMethod.get:
        return Uri.http(baseUri, task.endpointURL ?? '', task.parameters);

      case HTTPMethod.post:
      case HTTPMethod.patch:
      case HTTPMethod.delete:
        return Uri.http(baseUri, task.endpointURL ?? '');
    }
  }
}

extension APIClientExtension on APIClient {
  void _addHeader(Map<String, String> additionalHeader) {
    for (var entry in additionalHeader.entries) {
      header[entry.key] = entry.value;
    }
  }
}
