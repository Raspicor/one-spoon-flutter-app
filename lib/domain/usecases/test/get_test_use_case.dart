import '../../models.dart';
import '../../usecases.dart';
import '../../repositories.dart';

class GetTestUseCase extends ITestUseCase {
  final ITestRepository testRepo;

  GetTestUseCase({
    required this.testRepo,
  });

  @override
  Future<List<dynamic>> invoke(String sender) async {
    TestInfo test = TestInfo(testId: sender);
    List<dynamic> resultList =
        await testRepo.getTest(test).then((value) => value);
    return resultList;
  }
}
