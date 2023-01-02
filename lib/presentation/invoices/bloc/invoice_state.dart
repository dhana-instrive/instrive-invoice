part of 'invoice_bloc.dart';

@immutable
abstract class InvoiceState {}

class InvoiceInitial extends InvoiceState {}

class Loading extends InvoiceState {}

class InvoiceLoading extends InvoiceState {}

class InvoiceFetched extends InvoiceState {
  final List<Invoice> invoices;

  InvoiceFetched({
    required this.invoices
  });
}

class InvoiceCreated extends InvoiceState {}

class Failure extends InvoiceState {}
