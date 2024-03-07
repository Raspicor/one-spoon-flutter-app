import 'dart:async';
import '../../models.dart';

abstract class ITestRepository {
  Future<void> getTest(TestInfo sender);
}
