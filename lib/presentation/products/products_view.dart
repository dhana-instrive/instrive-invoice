import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instrive_invoice_ninja/presentation/products/bloc/products_bloc.dart';
import 'package:invoiceninja/models/product.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  
   @override
  void initState() {
    context.read<ProductsBloc>().add(GetProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PRODUCTS"),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (_, state){
          if(state is ProductsLoading){
            return const Center(child: CircularProgressIndicator());
          }else if(state is ProductsFetched){
            return ProductsBuilder(products: state.products);
          }else{
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class ProductsBuilder extends StatelessWidget {
  final List<Product> products; 
  const ProductsBuilder({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      itemCount: products.length,
      itemBuilder: (_, index){
        return ProductsItem(product: products[index]);
      });
  }
}


class ProductsItem extends StatelessWidget {
  final Product product;
  const ProductsItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [ BoxShadow(
          color: Theme.of(context).splashColor,
          blurRadius: 2.0,
          spreadRadius: 5.0
          ) ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(product.id)),
              Text(product.price.toString())
            ],
          ),
        ],
      ),
    );
  }
}