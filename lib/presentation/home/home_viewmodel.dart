import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instrive_invoice_ninja/presentation/clients/bloc/clients_bloc.dart';
import 'package:instrive_invoice_ninja/presentation/invoices/bloc/invoice_bloc.dart';
import 'package:instrive_invoice_ninja/presentation/products/bloc/products_bloc.dart';
import 'package:instrive_invoice_ninja/presentation/products/products_view.dart';

import '../base/base_view_model.dart';
import '../clients/pages/clients/clients_view.dart';
import '../invoices/pages/invoice/invoice_view.dart';
import 'cubit/home_cubit.dart';

class HomeViewModel extends BaseViewModel{

  HomeViewModel._internal(){ start(); }
  static final _instance = HomeViewModel._internal();
  factory HomeViewModel() => _instance;

  late final HomeCubit cubit;
  late final PageController pageController;
  late final int currentIndex;

  List<Widget> getPages(BuildContext context){
    return [
      BlocProvider(
        create: (_)=>ClientsBloc(),
        child: const ClientsView()),
      BlocProvider(
        create: (_)=>InvoiceBloc(),
        child: const InvoiceView()),
      BlocProvider(
        create: (_)=>ProductsBloc(),
        child: const ProductsView()),
    ];
  }

  void onPageChange(int index){
    cubit.onPageChange(index);
  }

  void onTap(int index){
    pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  void start() {
    cubit = HomeCubit();
    currentIndex = 0;
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    cubit.close();
  }

}