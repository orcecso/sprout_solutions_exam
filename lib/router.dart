import 'package:auto_route/auto_route.dart';
import 'package:sprout_solutions_exam/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MyHomeRoute.page, initial: true),
        AutoRoute(page: MainProductList.page),
        AutoRoute(page: MainProductContents.page),
      ];
}
