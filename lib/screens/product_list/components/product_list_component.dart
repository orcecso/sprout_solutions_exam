import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprout_solutions_exam/screens/product_list/bloc/product_list_bloc.dart';

class ProductListComponent extends StatefulWidget {
  const ProductListComponent({super.key});

  @override
  State<ProductListComponent> createState() => _ProductListComponentState();
}

class _ProductListComponentState extends State<ProductListComponent> {
  late final ProductListBloc _productListBloc;

  @override
  void initState() {
    _productListBloc = BlocProvider.of<ProductListBloc>(context);
    _productListBloc.add(const ProductListInitialEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductListBloc, ProductListState>(
      listener: (context, state) {},
      builder: ((context, state) {
        if (state.status.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status.isSuccess) {
          return ListView.builder(
            itemCount: state.products.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Text(state.products[index].title);
            },
          );
        } else {
          return const Center(
            child: Text("Failed to load products"),
          );
        }
      }),
    );
  }
}
