import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprout_solutions_exam/screens/product_contents/bloc/product_content_bloc.dart';
import 'package:sprout_solutions_exam/screens/product_contents/components/product_content_component.dart';

@RoutePage()
class MainProductContents extends StatelessWidget {
  const MainProductContents({super.key, required this.productId});
  final int productId;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductContentBloc(),
        ),
      ],
      child: ProductContentComponent(productId: productId),
    );
  }
}
