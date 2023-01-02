import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instrive_invoice_ninja/app/app_routes.dart';
import 'package:instrive_invoice_ninja/presentation/clients/bloc/clients_bloc.dart';
import 'package:invoiceninja/models/client.dart';

class ClientsView extends StatefulWidget {
  const ClientsView({super.key});

  @override
  State<ClientsView> createState() => _ClientsViewState();
}

class _ClientsViewState extends State<ClientsView> {

  @override
  void initState() {
    context.read<ClientsBloc>().add(GetClients());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CLIENTS"),
      ),
      body: BlocBuilder<ClientsBloc, ClientsState>(
        builder: (_, state){
          if(state is ClientsLoading){
            return const Center(child: CircularProgressIndicator());
          }else if(state is ClientsFetched){
            return ClientsBuilder(clients: state.clients);
          }else{
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class ClientsBuilder extends StatelessWidget {
  final List<Client> clients; 
  const ClientsBuilder({super.key, required this.clients});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      itemCount: clients.length,
      itemBuilder: (_, index){
        return ClientsItem(client: clients[index]);
      });
  }
}

class ClientsItem extends StatelessWidget {
  final Client client;
  const ClientsItem({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.of(context).pushNamed(Routes.clientDetail, arguments: client),
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
              Expanded(child: Text(client.name)),
              Text(client.balance.toString())
            ],
          ),
          const SizedBox(height: 8,),
          Row(
            children: [
              Expanded(child: Text(client.vatNumber.toString())),
              Text(client.city)
            ],
          )
        ],
      ),
    ));
  }
}