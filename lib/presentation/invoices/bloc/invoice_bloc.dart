import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:invoiceninja/invoiceninja.dart';
import 'package:invoiceninja/models/client.dart';
import 'package:invoiceninja/models/invoice.dart';
import 'package:meta/meta.dart';

part 'invoice_event.dart';
part 'invoice_state.dart';

class InvoiceBloc extends Bloc<InvoiceEvent, InvoiceState> {
  InvoiceBloc() : super(InvoiceInitial()) {
      on<GetInvoices>(_onGetInvoices);
      on<CreateInvoice>(_onCreateInvoice);
  }

  void _onCreateInvoice(CreateInvoice event, Emitter emit) async{
    emit(Loading());

    var invoice = Invoice(
      createdAt: DateTime.now().millisecondsSinceEpoch,
      createdById: event.client.name,
      clientId: event.client.id,
      amount: 200,
      dueDate: DateFormat('d MMM, yyyy').format(DateTime.now().add(const Duration(days: 10))) 
    );

    await InvoiceNinjaAdmin.invoices.save(invoice);

    emit(InvoiceCreated());
  }

  void _onGetInvoices(GetInvoices event, Emitter emit) async{
    emit(InvoiceLoading());
    try{
      final invoices = await InvoiceNinjaAdmin.invoices.load();
      emit(InvoiceFetched(invoices: invoices));
    }catch(e){
      emit(Failure());
    }
  }
}
