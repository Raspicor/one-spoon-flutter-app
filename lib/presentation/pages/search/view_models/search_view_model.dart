import 'package:flutter/material.dart';
import 'package:one_spoon/domain/usecases.dart';

class SearchViewModel extends ChangeNotifier {
  final GetTestUseCase getTestUseCase;

  SearchViewModel({
    required this.getTestUseCase,
  });

  final String userId = 'user';

  void getTest() {
    getTestUseCase.invoke(userId).then((value) => value);
  }
}
