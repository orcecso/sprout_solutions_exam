import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class SproutScaffold extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Future<bool> Function()? onWillPop;

  const SproutScaffold({
    super.key,
    required this.child,
    this.appBar,
    this.bottomNavigationBar,
    this.onWillPop,
  });

  SystemUiOverlayStyle get systemUiOverlayStyle;
  Color? get backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        key: const Key('annotated_region'),
        value: systemUiOverlayStyle,
        child: Scaffold(
          key: const Key('scaffold_body'),
          appBar: appBar,
          backgroundColor: backgroundColor,
          bottomNavigationBar: bottomNavigationBar,
          body: SafeArea(
            key: const Key('safe_area_body'),
            bottom: false,
            child: child,
          ),
        ),
      ),
    );
  }
}

class DefaultSproutScaffold extends SproutScaffold {
  final SystemUiOverlayStyle _systemUiOverlayStyle;
  final Color? _backgroundColor;

  const DefaultSproutScaffold({
    super.key,
    required super.child,
    super.appBar,
    super.bottomNavigationBar,
    super.onWillPop,
    required SystemUiOverlayStyle systemUiOverlayStyle,
    Color? backgroundColor,
  })  : _systemUiOverlayStyle = systemUiOverlayStyle,
        _backgroundColor = backgroundColor;

  @override
  SystemUiOverlayStyle get systemUiOverlayStyle => _systemUiOverlayStyle;

  @override
  Color? get backgroundColor => _backgroundColor;
}
