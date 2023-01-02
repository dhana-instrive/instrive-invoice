import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:invoiceninja/invoiceninja.dart';
import 'package:invoiceninja/models/client.dart';

part 'clients_event.dart';
part 'clients_state.dart';

class ClientsBloc extends Bloc<ClientsEvent, ClientsState> {
  ClientsBloc() : super(ClientsInitial()) {
    on<GetClients>(_onGetClients);
  }

  void _onGetClients(GetClients event, Emitter emit)async{
    emit(ClientsLoading());
    try{
      final clients = await InvoiceNinjaAdmin.clients.load();
      emit(ClientsFetched(clients: clients));
    }catch(e){
      emit(Failure());
    }
  }
}
