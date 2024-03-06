import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sprout_solutions_exam/router.gr.dart';

@RoutePage()
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Sprout Solutions Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: () {
             context.router.push(const MainProductList()); 
            }, child: const Text('Press here'))
          ],
        ),
      ),
    );
  }
}
