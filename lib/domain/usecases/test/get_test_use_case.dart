import '../../models.dart';
import '../../usecases.dart';
import '../../repositories.dart';

class GetTestUseCase extends ITestUseCase {
  final ITestRepository testRepo;

  GetTestUseCase({
    required this.testRepo,
  });

  @override
  Future<void> invoke(String sender) {
    TestInfo test = TestInfo(testId: sender);
    return testRepo.getTest(test).then((value) => value);
  }
}
