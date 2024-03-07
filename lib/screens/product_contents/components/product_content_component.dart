import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprout_solutions_exam/screens/product_contents/bloc/product_content_bloc.dart';
import 'package:sprout_solutions_exam/utis/app_theme/app_theme.dart';
import 'package:sprout_solutions_exam/widgets/sprout_scaffold.dart';

class ProductContentComponent extends StatefulWidget {
  const ProductContentComponent({super.key, required this.productId});
  final int productId;

  @override
  State<ProductContentComponent> createState() =>
      _ProductContentComponentState();
}

class _ProductContentComponentState extends State<ProductContentComponent> {
  late final ProductContentBloc _productContentBloc;

  @override
  void initState() {
    _productContentBloc = BlocProvider.of<ProductContentBloc>(context);
    _productContentBloc.add(ProductContentInitialEvent(widget.productId));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultSproutScaffold(
      systemUiOverlayStyle: SproutAppTheme.defaultSystemUIOverlayStyle,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Contents"),
      ),
      child: BlocBuilder<ProductContentBloc, ProductContentState>(
        builder: (context, state) {
          if (state.status.isSuccess) {
            return RefreshIndicator(
              onRefresh: () async {
                _productContentBloc
                    .add(ProductContentInitialEvent(widget.productId));
              },
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "Here are the details of the product you selected",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Image.network(
                      state.products!.thumbnail ?? '',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      state.products!.title ?? '',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Price: \$${state.products!.price.toString()}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      'Discount: ${state.products!.discountPercentage.toString()}%',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Rating: ${state.products!.rating.toString()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Stock: ${state.products!.stock.toString()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Brand: ${state.products!.brand ?? ''}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Category: ${state.products!.category ?? ''}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Description:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      state.products!.description ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Images:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.products!.images?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.network(
                              state.products!.images?[index] ?? '',
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
