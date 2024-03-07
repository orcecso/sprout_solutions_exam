import 'package:flutter_test/flutter_test.dart';
import 'package:sprout_solutions_exam/router.dart';
import 'package:sprout_solutions_exam/router.gr.dart';

void main() {
  test('AppRouter should define routes correctly', () {
    final appRouter = AppRouter();

    final routes = appRouter.routes;

    expect(routes.length, 3);

    expect(routes.any((route) => route.path is MyHomeRoute), true);
    expect(routes.any((route) => route.path is MainProductList), true);
    expect(routes.any((route) => route.path is MainProductContents), true);
  });
}
