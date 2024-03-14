import 'package:flutter/material.dart';
import 'package:one_spoon/domain/repositories/test/i_test_repository.dart';
import 'package:provider/provider.dart';
import 'package:one_spoon/app_router.dart';
import 'package:provider/single_child_widget.dart';
import 'domain/usecases.dart';
import 'presentation/view_models.dart';
import 'data/repositories.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ...repositories,
        ...useCases,
        ...viewModels,
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.standard,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => child!,
    );
  }
}

List<SingleChildWidget> get repositories => [
      Provider<ITestRepository>(
        create: (context) => TestRepository(),
      )
    ];

List<SingleChildWidget> get useCases => [
      Provider<GetTestUseCase>(
        create: (context) =>
            GetTestUseCase(testRepo: context.read<ITestRepository>()),
      )
    ];

List<SingleChildWidget> get viewModels => [
      ChangeNotifierProvider<StartViewModel>(
        create: (context) => StartViewModel(),
      ),
      ChangeNotifierProvider<SearchViewModel>(
        create: (context) =>
            SearchViewModel(getTestUseCase: context.read<GetTestUseCase>()),
      )
    ];
