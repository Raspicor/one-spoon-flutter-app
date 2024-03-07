import 'dart:async';

import '../../api_clients.dart';
import '../../../domain/models.dart';
import '../../../domain/repositories.dart';

class TestRepository implements ITestRepository {
  final _testAPIClient = TestAPIClient();

  @override
  Future<void> getTest(TestInfo sender) async {
    await _testAPIClient.getTest(sender);
  }
}
