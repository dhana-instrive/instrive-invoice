import 'package:flutter/material.dart';
import 'package:instrive_invoice_ninja/app/app_routes.dart';
import 'package:instrive_invoice_ninja/widgets/text_w_header.dart';
import 'package:invoiceninja/models/client.dart';

class ClientDetailView extends StatefulWidget {
  final Client client;
  const ClientDetailView({
    super.key,
    required this.client  
  });

  @override
  State<ClientDetailView> createState() => _ClientDetailViewState();
}

class _ClientDetailViewState extends State<ClientDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Stack(
        children: [
          DetailsBuilder(client: widget.client),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: ()=>Navigator.of(context).pushNamed(Routes.invoiceAdd, arguments: widget.client),
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Theme.of(context).primaryColor,
                width: double.infinity,
                child: Text("Create Invoice", style: Theme.of(context).textTheme.button!.copyWith(color: Colors.white), textAlign: TextAlign.center),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DetailsBuilder extends StatelessWidget {
  final Client client;
  const DetailsBuilder({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        TextWHeader(header1: "Client Name", value1: client.name),
        const SizedBox(height: 20,),
        TextWHeader(
          header1: "Balance", value1: client.balance.toString(),
          header2: "Credit Balance", value2: client.creditBalance.toString(),
          ),
        const SizedBox(height: 20,),
        TextWHeader(header1: "Address", value1: client.address2),
      ],
    );
  }
}