part of 'clients_bloc.dart';

@immutable
abstract class ClientsState {}

class ClientsInitial extends ClientsState {}

class ClientsLoading extends ClientsState {}

class Failure extends ClientsState {}

class ClientsFetched extends ClientsState {
  final List<Client> clients;

  ClientsFetched({
    required this.clients
  });
}