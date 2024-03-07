// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:sprout_solutions_exam/screens/home_screen.dart' as _i3;
import 'package:sprout_solutions_exam/screens/product_contents/main.dart'
    as _i1;
import 'package:sprout_solutions_exam/screens/product_list/main.dart' as _i2;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MainProductContents.name: (routeData) {
      final args = routeData.argsAs<MainProductContentsArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.MainProductContents(
          key: args.key,
          productId: args.productId,
        ),
      );
    },
    MainProductList.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MainProductList(),
      );
    },
    MyHomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MyHomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.MainProductContents]
class MainProductContents extends _i4.PageRouteInfo<MainProductContentsArgs> {
  MainProductContents({
    _i5.Key? key,
    required int productId,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          MainProductContents.name,
          args: MainProductContentsArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'MainProductContents';

  static const _i4.PageInfo<MainProductContentsArgs> page =
      _i4.PageInfo<MainProductContentsArgs>(name);
}

class MainProductContentsArgs {
  const MainProductContentsArgs({
    this.key,
    required this.productId,
  });

  final _i5.Key? key;

  final int productId;

  @override
  String toString() {
    return 'MainProductContentsArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [_i2.MainProductList]
class MainProductList extends _i4.PageRouteInfo<void> {
  const MainProductList({List<_i4.PageRouteInfo>? children})
      : super(
          MainProductList.name,
          initialChildren: children,
        );

  static const String name = 'MainProductList';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MyHomePage]
class MyHomeRoute extends _i4.PageRouteInfo<void> {
  const MyHomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          MyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
