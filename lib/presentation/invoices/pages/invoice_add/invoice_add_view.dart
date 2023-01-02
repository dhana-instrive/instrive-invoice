import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instrive_invoice_ninja/app/app_routes.dart';
import 'package:instrive_invoice_ninja/presentation/invoices/bloc/invoice_bloc.dart';
import 'package:instrive_invoice_ninja/presentation/resources/color_manager.dart';
import 'package:invoiceninja/models/client.dart';

class InvoiceAddView extends StatefulWidget {
  final Client client;
  const InvoiceAddView({super.key, required this.client});

  @override
  State<InvoiceAddView> createState() => _InvoiceAddViewState();
}

class _InvoiceAddViewState extends State<InvoiceAddView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InvoiceBloc, InvoiceState>(
      listener: (_, state){
        if(state is InvoiceCreated){
          Navigator.of(context).pushNamed(Routes.main);
        }
      },
      child: Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: ()=>{
                context.read<InvoiceBloc>().add(CreateInvoice(client: widget.client))
              },
              child: BlocBuilder<InvoiceBloc, InvoiceState>(
                builder: (_, state){
                  return Container(
                    padding: const EdgeInsets.all(20),
                    color: Theme.of(context).primaryColor,
                    width: double.infinity,
                    child: state is Loading 
                      ? SizedBox(
                        width: 30,
                        height: 30,
                        child: Center(
                        child: CircularProgressIndicator(color: ColorManger.white, strokeWidth: 2,),
                      ) ,
                      )
                      : Text("Create", style: Theme.of(context).textTheme.button!.copyWith(color: Colors.white), textAlign: TextAlign.center),
                  );
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class InvoiceFields extends StatelessWidget {
  const InvoiceFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}