import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprout_solutions_exam/screens/product_list/bloc/product_list_bloc.dart';
import 'package:sprout_solutions_exam/screens/product_list/components/product_list_component.dart';

@RoutePage()
class MainProductList extends StatelessWidget {
  const MainProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductListBloc(),
        ),
      ],
      child: const ProductListComponent(),
    );
  }
}
