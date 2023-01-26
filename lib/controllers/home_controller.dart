import 'package:flutter/material.dart';
import 'package:tada_score_analysis/config.dart';
import 'package:tada_score_analysis/screens/Result/result_page.dart';
import 'package:tada_score_analysis/services/checking_service_for_analysis.dart';

class HomeController{
  static int standardErrorOfEvaluation = 0;
  
  static handleStartAnalyzing({
    required String totalCredits, 
    required String accumulatedCredits, 
    required String averageAccumulatedScores, 
    required String conditionalCredits, 
    required String failedCredits, 
    required String unfinishedConditionalCredits, 
    required int isDissertation, 
    required int type,
    required BuildContext context,
  }){
    bool isAllValuesFilled = CheckingServiceForAnalysis.checkIfAllValuesAreFilled(
      totalCredits, 
      accumulatedCredits, 
      averageAccumulatedScores, 
      conditionalCredits, 
      unfinishedConditionalCredits, 
      failedCredits
    );

    if(!isAllValuesFilled){
      return ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          showCloseIcon: true,
          closeIconColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical:10,horizontal:20),
          content: Text("Vui lòng nhập đầy đủ các thông tin",style: TextStyle(fontSize:18),),
        )
      );
    }

    String error = CheckingServiceForAnalysis.checkIfValueIsValid(
      totalCredits: int.parse(totalCredits), 
      accumulatedCredits: int.parse(accumulatedCredits), 
      averageAccumulatedScores:double.parse(averageAccumulatedScores), 
      conditionalCredits: int.parse(conditionalCredits), 
      failedCredits: int.parse(failedCredits), 
      unfinishedConditionalCredits: int.parse(unfinishedConditionalCredits),
    );

    if(error.isNotEmpty){
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          showCloseIcon: true,
          closeIconColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical:10,horizontal:20),
          content: Text(error,style: const TextStyle(fontSize:18),),
        )
      );
    }

    bool isDownGraded = int.parse(failedCredits) > 0.05*int.parse(totalCredits);
    if(isDownGraded && type == 1){
      return Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context)=> ResultPage(
            failedToContinue: true,
            conclusion: const {
              "title":'Mục tiêu của bạn không khả thi',
              "description":'Việc đạt được xếp loại xuất sắc là không thể do tổng tín chỉ điểm F đã hơn 5% tổng tín chỉ chương trình đào tạo'
            },
            isDissertation: isDissertation,
          )
        )
      );
    }

    int targetedTitle = type;
    if(isDownGraded){
        targetedTitle -=1;
    }

    double minimumScoreToAchiveTitle = TadaConfig.thresholdTitle[targetedTitle.toString()]!;
    double productOfCreditsLeftAndScoreToFulfill = minimumScoreToAchiveTitle * (int.parse(totalCredits) - int.parse(conditionalCredits)) - (int.parse(accumulatedCredits) - (int.parse(conditionalCredits) - int.parse(unfinishedConditionalCredits)))*double.parse(averageAccumulatedScores);
    
    int unconditionalCreditsLeft = int.parse(totalCredits) - int.parse(accumulatedCredits) - int.parse(unfinishedConditionalCredits);
    double averageScoreOfAllCreditsScoreToFulfill =  productOfCreditsLeftAndScoreToFulfill / unconditionalCreditsLeft;
  
    if(averageScoreOfAllCreditsScoreToFulfill > 4){
      return Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context)=> ResultPage(
            failedToContinue: true,
            conclusion: {
              "title":'Mục tiêu của bạn không khả thi',
              "description":'Để đạt được xếp loại bạn muốn thì điểm số trung bình các học phần còn lại phải đạt ${averageScoreOfAllCreditsScoreToFulfill.toStringAsFixed(4)} trở lên trong khi giới hạn điểm học phần chỉ là 4'
            },
            isDissertation: isDissertation,
          )
        )
      );
    }

    int creditForIsDissertatonVariable = TadaConfig.tenCreditsLeft.where((i) => i["value"] == isDissertation).toList()[0]['credit'];
    
    if(unconditionalCreditsLeft - creditForIsDissertatonVariable == 0){
      List<Map<String,dynamic>> allPossibleScoresToFulfillTheTarget = TadaConfig.scoresList.where((item) => item['score'] <= productOfCreditsLeftAndScoreToFulfill / creditForIsDissertatonVariable).toList();
      int thresholdLine = allPossibleScoresToFulfillTheTarget.isNotEmpty ? allPossibleScoresToFulfillTheTarget[0]["type"] : 7;
      Map<String,dynamic> validScoreType = TadaConfig.scoresList.where((item) => 
        (
          (productOfCreditsLeftAndScoreToFulfill / creditForIsDissertatonVariable) is int || 
          allPossibleScoresToFulfillTheTarget.isEmpty
        )
        ? item['type'] == thresholdLine 
        : item['type'] == thresholdLine - 1
      ).toList()[0];
        
      return Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context)=> ResultPage(
            failedToContinue: false,
            conclusion: {
              "special":true,
              "A":[validScoreType],
            },
            isDissertation: isDissertation,
          )
        )
      );
    }

    if(unconditionalCreditsLeft - creditForIsDissertatonVariable < 0){
      return Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context)=> ResultPage(
            failedToContinue: true,
            conclusion: {
              "title":"Hmmm...Vui lòng kiểm tra kỹ lại thông tin",
              "description":'Hãy đảm bảo rằng số tín chỉ học phần không điều kiện còn lại phải bao gồm cả ${isDissertation ==1 ? 'luận văn' : 'tiểu luận'}'
            },
            isDissertation:isDissertation,
          )
        )
      );
    }

    double averageScoreWhenDissertationIsA = (productOfCreditsLeftAndScoreToFulfill - 4 * creditForIsDissertatonVariable) / (unconditionalCreditsLeft - creditForIsDissertatonVariable);
    double averageScoreWhenDissertationIsBplus = (productOfCreditsLeftAndScoreToFulfill - 3.5 * creditForIsDissertatonVariable) / (unconditionalCreditsLeft - creditForIsDissertatonVariable);
    double averageScoreWhenDissertationIsB = (productOfCreditsLeftAndScoreToFulfill - 3 * creditForIsDissertatonVariable) / (unconditionalCreditsLeft - creditForIsDissertatonVariable);

    final result1 = CheckingServiceForAnalysis.amountOfScoreTypeToFulfill(
      averageTargetScore:averageScoreWhenDissertationIsA,
      unconditionalCreditsLeftExcludingDissertation:unconditionalCreditsLeft - creditForIsDissertatonVariable,
    );

    final result2 = CheckingServiceForAnalysis.amountOfScoreTypeToFulfill(
      averageTargetScore:averageScoreWhenDissertationIsBplus,
      unconditionalCreditsLeftExcludingDissertation:unconditionalCreditsLeft - creditForIsDissertatonVariable,
    );

    final result3 = CheckingServiceForAnalysis.amountOfScoreTypeToFulfill(
      averageTargetScore:averageScoreWhenDissertationIsB,
      unconditionalCreditsLeftExcludingDissertation:unconditionalCreditsLeft - creditForIsDissertatonVariable,
    );
      
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context)=> ResultPage(
          failedToContinue:false,
          conclusion: isDissertation == 3 
          ?
          {"A":result1}
          :
          {"A":result1,"B+":result2,"B":result3},
          isDissertation: isDissertation,
        )
      )
    );
  }
}