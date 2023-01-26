import 'package:flutter/material.dart';

class DropDownTextFieldForHomePage extends StatelessWidget {
  const DropDownTextFieldForHomePage({
    Key? key,
    required this.title,
    required this.updateStateOfTheDropDown,
    required this.inputValue,
    required this.listOfDropDownItems,
  }) : super(key: key);

  final String title;
  final Function updateStateOfTheDropDown;
  final int inputValue;
  final List<Map<String,dynamic>> listOfDropDownItems;

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
        Container(
          padding:const EdgeInsets.symmetric(horizontal:10,vertical:10),
          decoration: BoxDecoration(
            color:Colors.black,
            borderRadius: BorderRadius.circular(8),
            border:Border.all(
              width:3,
              color:Colors.white,
            ),
          ),
          child: DropdownButton<String>(
            underline: const SizedBox(),
            isDense: true,
            iconEnabledColor: Colors.white,
            borderRadius: BorderRadius.circular(10),
            focusColor: Colors.white,
            isExpanded: true,
            value:inputValue.toString(),
            dropdownColor: Colors.black,
            style: const TextStyle( 
              color: Colors.white,
              fontSize: 18
            ),
            items: <Map<String,dynamic>>[...listOfDropDownItems].map((Map<String,dynamic> value) {
              return DropdownMenuItem<String>(
                value: value['value'].toString(),
                child: Text(value['label']),
              );
            }).toList(),
            onChanged: (String ? newValue) {
              updateStateOfTheDropDown(int.parse(newValue!));
            },
          ),
        ),
      ],
    );
  }
}