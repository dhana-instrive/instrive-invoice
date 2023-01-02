import 'package:bloc/bloc.dart';
import 'package:invoiceninja/invoiceninja.dart';
import 'package:invoiceninja/models/product.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<GetProducts>(_onGetProducts);
  }

  void _onGetProducts(GetProducts event, Emitter emit)async{
    emit(ProductsLoading());
    try{
      final products = await InvoiceNinjaAdmin.products.load();
      emit(ProductsFetched(products: products));
    }catch(e){
      emit(Failure());
    }
  }
}
