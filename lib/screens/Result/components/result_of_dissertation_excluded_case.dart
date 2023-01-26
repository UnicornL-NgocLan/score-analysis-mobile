import 'package:flutter/material.dart';

class ResultOfDissertationExcludedCaseForResultPage extends StatelessWidget {
  const ResultOfDissertationExcludedCaseForResultPage({
    Key? key,
    required this.conclusionForMilestone,
  }) : super(key: key);

  final dynamic conclusionForMilestone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:30,vertical:16),
      child: Column(
        children: [
          conclusionForMilestone != null
          ?
            conclusionForMilestone.length == 0
            ?
            const Text("Bạn chỉ cần qua môn là được",
              style: TextStyle(
                fontSize:18,
                color:Colors.white,
              ),
            )
            :
            conclusionForMilestone.length > 1 && conclusionForMilestone[0] != null && conclusionForMilestone[1] != null
            ?
            Text('Bạn cần phải đạt mức ${conclusionForMilestone[0]?['des']} cho ${conclusionForMilestone[0]?['number']} tín chỉ và ${conclusionForMilestone[1]?['des']} cho ${conclusionForMilestone[1]?['number']} tín chỉ còn lại',
              style: const TextStyle(
                fontSize:18,
                color:Colors.white,
              ),
            )
            :
            Text('Bạn cần phải đạt mức ${conclusionForMilestone[0]?['des']} cho ${conclusionForMilestone[0]?['number']} tín chỉ còn lại',
              style: const TextStyle(
                fontSize:18,
                color:Colors.white,
              ),
            )
          :
          const Text("")
        ]
      ),
    );
  }
}