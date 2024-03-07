import '../../../domain/models.dart';
import '../../api_client/api_client.dart';

class _GetTestTask implements HTTPTask {
  final TestInfo test;

  _GetTestTask({
    required this.test,
  });

  @override
  String? get endpointURL => '/test';

  @override
  HTTPMethod get method => HTTPMethod.get;

  @override
  dynamic get parameters => null;

  @override
  Map<String, String>? get additionalHeader => null;
}

class TestAPIClient extends APIClient {
  Future<dynamic> getTest(TestInfo sender) async {
    _GetTestTask result = _GetTestTask(test: sender);
    return await send(result);
  }
}
