import 'package:flutter/material.dart';
import 'package:instrive_invoice_ninja/app/app.dart';
import 'package:instrive_invoice_ninja/app/constants.dart';
import 'package:invoiceninja/invoiceninja.dart';

void main() {

  InvoiceNinja.configure(
    Constants.invoiceKey , 
    url: Constants.invoiceHostUrl , 
    debugEnabled: true,
  );

  InvoiceNinjaAdmin.configure(
    'TOKEN', 
    url: 'https://demo.invoiceninja.com', 
    debugEnabled: true,
  );

  runApp(App());
}
