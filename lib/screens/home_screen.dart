import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sprout_solutions_exam/router.gr.dart';
import 'package:sprout_solutions_exam/utis/app_theme/app_theme.dart';
import 'package:sprout_solutions_exam/widgets/sprout_scaffold.dart';

@RoutePage()
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultSproutScaffold(
      systemUiOverlayStyle: SproutAppTheme.defaultSystemUIOverlayStyle,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Sprout Solutions Test"),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                context.router.push(const MainProductList());
              },
              child: const Text('Press here'),
            ),
          ],
        ),
      ),
    );
  }
}
