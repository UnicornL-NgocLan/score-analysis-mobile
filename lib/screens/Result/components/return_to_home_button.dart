import 'package:flutter/material.dart';

class ReturnHomeButton extends StatelessWidget {
  const ReturnHomeButton({
    Key? key,
    required this.parentContext,
  }) : super(key: key);

  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical:20,horizontal:30),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation:10,
                padding: const EdgeInsets.all(20),
                backgroundColor: const Color(0xFF3a7190),
              ),
              onPressed:()=>{
                Navigator.of(parentContext).pop()
              },
              child: const Text('Quay trở lại', style: TextStyle(fontSize:18))
            ),
          ),
        ),
        const SizedBox(height:30),
      ],
    );
  }
}