import 'package:flutter/material.dart';

import '../presentation/resources/color_manager.dart';
import '../presentation/resources/style_manager.dart';

class TextWHeader extends StatelessWidget {
  final String header1;
  final String? header2;
  final String value1;
  final String? value2;
  const TextWHeader({
    super.key,
    required this.header1,
    this.header2,
    required this.value1,
    this.value2  
  });

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(header1, style: getRegularStyle(color: ColorManger.grey, fontSize: 14)),
                  const SizedBox(height: 6,),
                  Text(value1, style: getBoldStyle(color: ColorManger.darkGrey, fontSize: 16))
                ],
              )),
            if(header2!=null)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(header2!, style: getRegularStyle(color: ColorManger.grey, fontSize: 14)),
                  const SizedBox(height: 6,),
                  Text(value2!, style: getBoldStyle(color: ColorManger.darkGrey, fontSize: 16))
                ],
              )),
          ],
        );
  }
}