import 'package:flutter/material.dart';
import 'package:tada_score_analysis/screens/Result/components/failed_to_proceed.dart';
import 'package:tada_score_analysis/screens/Result/components/logo_and_title.dart';
import 'package:tada_score_analysis/screens/Result/components/result_of_dissertation_excluded_case.dart';
import 'package:tada_score_analysis/screens/Result/components/result_of_each_case.dart';
import 'package:tada_score_analysis/screens/Result/components/return_to_home_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.failedToContinue,
    required this.conclusion,
    required this.isDissertation
  }) : super(key: key);

  final bool failedToContinue;
  final Map<String, dynamic> conclusion;
  final int isDissertation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover
              ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF043150).withOpacity(0.5),
            ),
            child: SingleChildScrollView(
              child: 
              failedToContinue
              ?
              FailedToProceedForResultPage(
                conclusion: conclusion,
                parentContext: context,
              )
              :
              Column(
                children: [
                  const LogoAndTitleForResultPage(),

                  conclusion["special"] != null
                  ?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child:
                    isDissertation == 3
                    ?
                    const Text("Hmmm...có vẻ điểm số toàn bộ các môn bạn học đã tích lũy hết rồi!!",
                      style: TextStyle(
                        fontSize:18,
                        color:Colors.white,
                      ),
                    )
                    :
                    Text('Bạn cần phải đạt mức ${conclusion["A"][0]?['des']} cho ${isDissertation == 1 ? 'luận văn' : 'tiểu luận'}',
                      style: const TextStyle(
                        fontSize:18,
                        color:Colors.white,
                      ),
                    )
                  )
                  :
                  isDissertation == 1 || isDissertation == 2
                  ?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical:0),
                    child: Column(
                      children: [
                        ResultOfEachCaseForResultPage(
                          conclusionForMilestone: conclusion["A"], 
                          isDissertation: isDissertation, 
                          targetMark: 'A'
                        ),
                        ResultOfEachCaseForResultPage(
                          conclusionForMilestone: conclusion["B+"], 
                          isDissertation: isDissertation, 
                          targetMark: 'B+'
                        ),
                        ResultOfEachCaseForResultPage(
                          conclusionForMilestone: conclusion["B"], 
                          isDissertation: isDissertation, 
                          targetMark: 'B'
                        )
                      ],
                    ),
                  )
                  :
                  ResultOfDissertationExcludedCaseForResultPage(
                    conclusionForMilestone: conclusion["A"],
                  ),

                  ReturnHomeButton(
                    parentContext: context,
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}