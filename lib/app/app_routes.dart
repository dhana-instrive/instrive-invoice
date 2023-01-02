import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instrive_invoice_ninja/presentation/clients/bloc/clients_bloc.dart';
import 'package:instrive_invoice_ninja/presentation/clients/pages/client_details/client_detail_view.dart';
import 'package:instrive_invoice_ninja/presentation/home/home_view.dart';
import 'package:instrive_invoice_ninja/presentation/invoices/bloc/invoice_bloc.dart';
import 'package:instrive_invoice_ninja/presentation/invoices/pages/invoice_add/invoice_add_view.dart';
import 'package:invoiceninja/models/client.dart';

import '../presentation/resources/string_manager.dart';

class Routes {
  //welcome
  static const String splash = "/";
  static const String main = "/main";

  //client
  static const String clientDetail = "/client_detail";

  //invoice
  static const String invoiceAdd = "/invoice_add";


}

class RouteGenerator {

  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.main :
        return MaterialPageRoute(builder: (_)=>const HomeView());
      case Routes.invoiceAdd :
        var client = settings.arguments as Client;
        return MaterialPageRoute(builder: (_)=>
            BlocProvider(create: (_)=>InvoiceBloc(), child: InvoiceAddView(client: client)));
      case Routes.clientDetail :
        var client = settings.arguments as Client;
        return MaterialPageRoute(builder: (_)=>
            BlocProvider(create: (_)=>ClientsBloc(), child: ClientDetailView(client: client)));
      default :
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>
      const Scaffold(
        body: Center(
          child: Text(AppStrings.notFound404),
        ),
      )
    );
  }

}
