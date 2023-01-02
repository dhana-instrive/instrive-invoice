part of 'invoice_bloc.dart';

@immutable
abstract class InvoiceEvent {}

class GetInvoices extends InvoiceEvent {}

class CreateInvoice extends InvoiceEvent {
  final Client client;
  CreateInvoice({
    required this.client
  });
}

