import 'package:flutter/material.dart';
import 'package:tada_score_analysis/screens/Result/components/return_to_home_button.dart';

class FailedToProceedForResultPage extends StatelessWidget {
  const FailedToProceedForResultPage({
    Key? key,
    required this.conclusion,
    required this.parentContext,
  }) : super(key: key);

  final Map<String,dynamic> conclusion;
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin:const EdgeInsets.only(top:50),
            padding: const EdgeInsets.symmetric(vertical:0,horizontal:30),
            child: Column(
              children:[
                Image.asset("assets/cross.png",width: 120, height: 120),
                const SizedBox(height:32),
                Text('${conclusion['title']}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize:26,
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height:24),
                Text('${conclusion['description']}',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize:18,
                  ),
                ),
                const SizedBox(height:24),
              ]
            ),
          ),
          ReturnHomeButton(
            parentContext: parentContext,
          )
        ],
      ),
    );
  }
}