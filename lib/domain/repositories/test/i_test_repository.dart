import 'dart:async';
import '../../models.dart';

abstract class ITestRepository {
  Future<List<dynamic>> getTest(TestInfo sender);
}
