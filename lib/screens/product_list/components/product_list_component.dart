import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprout_solutions_exam/router.gr.dart';
import 'package:sprout_solutions_exam/screens/product_list/bloc/product_list_bloc.dart';
import 'package:sprout_solutions_exam/utis/app_theme/app_theme.dart';
import 'package:sprout_solutions_exam/widgets/sprout_scaffold.dart';

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
    return DefaultSproutScaffold(
      systemUiOverlayStyle: SproutAppTheme.defaultSystemUIOverlayStyle,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Sprout Solutions Test"),
      ),
      child: BlocConsumer<ProductListBloc, ProductListState>(
        listener: (context, state) {},
        builder: ((context, state) {
          if (state.status.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status.isSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                _productListBloc.add(const ProductListInitialEvent());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    "Please Select a product Below",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: state.products.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return InkWell(
                          onTap: () => _checkContents(state.products[index].id),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  product.thumbnail ?? '',
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      product.title ?? '',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '\$${product.price.toString()}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Stock: ${product.stock.toString()}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      'Discount: ${product.discountPercentage.toString()}%',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(10, (index) {
                        return Row(
                          children: [
                            const SizedBox(width: 10),
                            TextButton(
                              onPressed: () => _nextPage(index + 1),
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return Colors.red;
                                    }
                                    return Colors.black;
                                  },
                                ),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return Colors.blue;
                                    }
                                    return Colors.blue;
                                  },
                                ),
                              ),
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text("Failed to load products"),
            );
          }
        }),
      ),
    );
  }

  _nextPage(int page) {
    _productListBloc.add(NextProductList(page));
  }

  _checkContents(int productId) {
    context.router.push(MainProductContents(productId: productId));
  }
}
