import 'package:go_router/go_router.dart';

import '../../../features/homepage/presentation/pages/dashboard/presentation/dashboard.dart';
import '../route_names/route_names.dart';

final homepageRoutes = [
  GoRoute(
    path: RouteNames.homepage.main,
    builder: (context, state) => const MainPage(),
  ),
];
