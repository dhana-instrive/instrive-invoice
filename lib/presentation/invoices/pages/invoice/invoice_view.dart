import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instrive_invoice_ninja/presentation/invoices/bloc/invoice_bloc.dart';
import 'package:invoiceninja/models/invoice.dart';
import 'package:url_launcher/url_launcher.dart';

class InvoiceView extends StatefulWidget {
  const InvoiceView({super.key});

  @override
  State<InvoiceView> createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {

  @override
  void initState() {
    context.read<InvoiceBloc>().add(GetInvoices());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("INVOICES"),
      ),
      body: BlocBuilder<InvoiceBloc, InvoiceState>(
        builder: (_, state){
          if(state is InvoiceLoading){
            return const Center(child: CircularProgressIndicator());
          }else if(state is InvoiceFetched){
            return InvoiceBuilder(invoices: state.invoices);
          }else{
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class InvoiceBuilder extends StatelessWidget {
  final List<Invoice> invoices; 
  const InvoiceBuilder({super.key, required this.invoices});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      itemCount: invoices.length,
      itemBuilder: (_, index){
        return InvoiceItem(invoice: invoices[index]);
      });
  }
}


class InvoiceItem extends StatelessWidget {
  final Invoice invoice;
  const InvoiceItem({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        await launchUrl(Uri.parse(invoice.url));
      },
      child: Container(
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
              Expanded(child: Text(invoice.number)),
              Text(invoice.amount.toString())
            ],
          ),
        ],
      ),
    ));
  }
}