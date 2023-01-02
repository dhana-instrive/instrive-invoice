part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsFetched extends ProductsState {
  final List<Product> products;

  ProductsFetched({
    required this.products
  });
}

class Failure extends ProductsState {}
