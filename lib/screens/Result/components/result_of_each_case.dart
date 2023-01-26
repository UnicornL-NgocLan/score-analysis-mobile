import 'package:flutter/material.dart';

class ResultOfEachCaseForResultPage extends StatelessWidget {
  const ResultOfEachCaseForResultPage({
    Key? key,
    required this.conclusionForMilestone,
    required this.isDissertation,
    required this.targetMark,
  }) : super(key: key);

  // Type of conclusionForMilestone is List<Map<String,dynamic>> or null
  final dynamic conclusionForMilestone;
  final int isDissertation;
  final String targetMark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical:conclusionForMilestone != null ? 16 : 0,
        horizontal:10
      ),
      child:
        conclusionForMilestone != null
        ?
          conclusionForMilestone.length == 0
          ?
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: const TextStyle(fontSize: 18,color:Colors.white),
              children: <TextSpan>[
                TextSpan(text:'Trường hợp ${isDissertation == 1 ? 'luận văn' : 'tiểu luận'} đạt $targetMark :',style: const TextStyle(fontWeight: FontWeight.w600)),
                const TextSpan(text:'Bạn chỉ cần qua môn là được')
              ]
            )
          )
          :
          conclusionForMilestone.length > 1 && conclusionForMilestone[0] != null && conclusionForMilestone[1] != null
          ?
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 18,color: Colors.white),
              children: <TextSpan>[
                TextSpan(text:'Trường hợp ${isDissertation == 1 ? 'luận văn' : 'tiểu luận'} đạt $targetMark :',style: const TextStyle(fontWeight: FontWeight.w600)),
                TextSpan(text:' Bạn cần phải đạt mức ${conclusionForMilestone[0]?['des']} cho ${conclusionForMilestone[0]?['number']} tín chỉ và ${conclusionForMilestone[1]?['des']} cho ${conclusionForMilestone[1]?['number']} tín chỉ còn lại')
              ]
            )
          )
          :
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 18,color: Colors.white),
              children: <TextSpan>[
                TextSpan(text:'Trường hợp ${isDissertation == 1 ? 'luận văn' : 'tiểu luận'} đạt $targetMark :',style: const TextStyle(fontWeight: FontWeight.w600)),
                TextSpan(text:'  Bạn cần phải đạt mức ${conclusionForMilestone[0]?['des']} cho các tín chỉ còn lại')
              ]
            )
          )
        :
        const Text("")
    );
  }
}