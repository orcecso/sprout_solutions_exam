import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SproutAppTheme {
  SproutAppTheme._();

  static final statusBarStyleLight = SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.black45,
  );

  static const defaultSystemUIOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.blueAccent,
  );
}
