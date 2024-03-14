import 'package:flutter/material.dart';
import 'package:one_spoon/domain/usecases.dart';

class SearchViewModel with ChangeNotifier {
  final GetTestUseCase getTestUseCase;

  SearchViewModel({
    required this.getTestUseCase,
  });

  final String keyword = 'user';
  late List<dynamic> testData = [];

  Future<void> getTest() async {
    testData = await getTestUseCase.invoke(keyword).then((value) => value);
    notifyListeners();
  }
}
