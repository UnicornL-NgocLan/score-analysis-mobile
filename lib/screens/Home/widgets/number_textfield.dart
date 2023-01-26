import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberTextFieldForHomePage extends StatelessWidget {
  const NumberTextFieldForHomePage({
    Key? key, 
    required this.inputController,
    required this.title,
    required this.isDecimal,
    required this.hintText,
  }) : super(key: key);

  final String title;
  final bool isDecimal;
  final String hintText;
  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height:20),
        Text(title,
          style:const TextStyle(
            fontSize:18,
            color:Colors.white
          )
        ),
        const SizedBox(height:12),
        TextField(
          controller: inputController,
          keyboardType: 
            isDecimal 
            ? const TextInputType.numberWithOptions(decimal: true) 
            : TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            // Chỉ được phép nhập số thập phân hoặc số nguyên dương
            FilteringTextInputFormatter.allow(
              isDecimal 
              ? RegExp(r'[0-9]+[.]{0,2}[0-9]*')
              : RegExp(r'[0-9]')
            )
          ],
          style:const TextStyle(
            fontSize:18,
            color:Colors.white,
          ),
          decoration: InputDecoration(
            border : OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
              borderSide:const BorderSide(
                color: Colors.white,
                width: 1,
              )
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                width: 3,
                color:Colors.white
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                width: 3,
                color:Colors.white
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 18,
              letterSpacing: 2,
              fontWeight: FontWeight.w600
            ),
            fillColor: const Color(0xFF071a29),
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal:12,vertical:8),
          )
        ),
      ],
    );
  }
}