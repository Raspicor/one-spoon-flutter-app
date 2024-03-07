import 'package:go_router/go_router.dart';
import 'presentation/pages.dart';

class AppRouter {
  static GoRouter get standard => GoRouter(
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            name: 'StartPage',
            builder: (context, state) => const StartPage(),
            routes: const <RouteBase>[],
          ),
          GoRoute(
            path: '/test',
            name: 'TestPage',
            builder: (context, state) => const SearchPage(),
          )
        ],
      );
}
