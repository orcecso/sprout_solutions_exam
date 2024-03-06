// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:sprout_solutions_exam/screens/home_screen.dart' as _i2;
import 'package:sprout_solutions_exam/screens/product_list/main.dart' as _i1;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MainProductList.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainProductList(),
      );
    },
    MyHomeRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MyHomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.MainProductList]
class MainProductList extends _i3.PageRouteInfo<void> {
  const MainProductList({List<_i3.PageRouteInfo>? children})
      : super(
          MainProductList.name,
          initialChildren: children,
        );

  static const String name = 'MainProductList';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MyHomePage]
class MyHomeRoute extends _i3.PageRouteInfo<void> {
  const MyHomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          MyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
