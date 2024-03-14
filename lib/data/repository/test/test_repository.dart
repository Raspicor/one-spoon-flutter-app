import 'dart:async';

import '../../api_clients.dart';
import '../../../domain/models.dart';
import '../../../domain/repositories.dart';

class TestRepository implements ITestRepository {
  final _testAPIClient = TestAPIClient();

  @override
  Future<List<dynamic>> getTest(TestInfo sender) async {
    return await _testAPIClient
        .getTest(sender)
        .then((value) => value['data']['recruitNames']);
  }
}
