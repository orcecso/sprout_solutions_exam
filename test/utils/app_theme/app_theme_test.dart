import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sprout_solutions_exam/utis/app_theme/app_theme.dart';

void main() {
  test('SproutAppTheme statusBarStyleLight should have correct values', () {
    final statusBarStyle = SproutAppTheme.statusBarStyleLight;

    expect(statusBarStyle.statusBarColor, Colors.black45);
  });

  test('SproutAppTheme defaultSystemUIOverlayStyle should have correct values',
      () {
    const defaultSystemUIOverlayStyle =
        SproutAppTheme.defaultSystemUIOverlayStyle;

    expect(defaultSystemUIOverlayStyle.statusBarColor, Colors.blueAccent);
  });
}
