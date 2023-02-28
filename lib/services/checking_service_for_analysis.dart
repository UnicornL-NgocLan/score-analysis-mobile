import 'package:tada_score_analysis/config.dart';

class CheckingServiceForAnalysis{
  static bool checkIfAllValuesAreFilled(
    String totalCredits,
    String accumulatedCredits,
    String averageAccumulatedScores,
    String conditionalCredits,
    String unfinishedConditionalCredits,
    String failedCredits,
  ){
    bool allValuesAreFilled = true;
    if(
      totalCredits.isEmpty || 
      accumulatedCredits.isEmpty || 
      averageAccumulatedScores.isEmpty ||
      conditionalCredits.isEmpty ||
      unfinishedConditionalCredits.isEmpty ||
      failedCredits.isEmpty
    ){
      allValuesAreFilled = false;
    }
    return allValuesAreFilled;
  }

  static String checkIfValueIsValid({
    required int totalCredits, 
    required int accumulatedCredits, 
    required double averageAccumulatedScores, 
    required int conditionalCredits, 
    required int failedCredits, 
    required int unfinishedConditionalCredits
  }){
    String error = "";
    if(totalCredits < 100 || totalCredits > 200){
      error = "Tổng tín chỉ ngành phải trong khoảng 100 đến 200 và nguyên dương";
    }else if(accumulatedCredits > totalCredits){
      error = "Tổng tín chỉ tích lũy không được lớn hơn tín chỉ ngành";
    }else if(accumulatedCredits <= 0){
      error = "Tổng tín chỉ tích lũy phải là số nguyên dương";
    }else if(averageAccumulatedScores < 0 || averageAccumulatedScores > 4){
      error = "Điểm trung bình tích lũy phải trong khoảng từ 0 đến 4";
    }else if(conditionalCredits <= 0){
      error = "Tổng tín chỉ học phần điều kiện phải là nguyên dương";
    }else if(unfinishedConditionalCredits < 0){
      error ="Tổng tín chỉ học phần chưa tích lũy phải là số nguyên và lớn hơn 0";
    }else if(failedCredits < 0){
      error = "Tổng tín chỉ bị điểm F không được là số âm và phải là số nguyên";
    }else if(failedCredits > totalCredits){
      error = "Tổng tín chỉ bị điểm F không được lớn hơn tín chỉ ngành";
    }else if(unfinishedConditionalCredits > conditionalCredits){
      error = "Các tín chỉ điều kiện chưa hoàn thành không lớn hơn tổng tín chỉ điều kiện";
    }else if(conditionalCredits>40){
      error = "Tổng tín chỉ học phần điều kiện quá lớn";
    }
    return error;
  }

  static amountOfScoreTypeToFulfill({
    required double averageTargetScore,
    required int unconditionalCreditsLeftExcludingDissertation,
  }){
    if(averageTargetScore > 4) return null;
    List<Map<String,dynamic>> scoresArr = [...TadaConfig.scoresList];
    int initialIndex = 0;
    
    double initialScoreToStart = TadaConfig.allScoreLevels.firstWhere((item) => (averageTargetScore - item).abs() <= 0.25, orElse: () => -1);
    if(initialScoreToStart == -1) return [];

    int thisItemIndexOfAllScoreLevels = TadaConfig.allScoreLevels.indexWhere((element) => element == initialScoreToStart);
    initialIndex = thisItemIndexOfAllScoreLevels;

    scoresArr = [...scoresArr].map((i) => i["score"] == initialScoreToStart ? {...i,"number":unconditionalCreditsLeftExcludingDissertation} : i).toList();
    int isGoingUpFirst = averageTargetScore - initialScoreToStart > 0 ? 1 : averageTargetScore - initialScoreToStart < 0 ? 2 : 0;
    bool finishAnalyzing = false;

    while (!finishAnalyzing){
      if(isGoingUpFirst == 2){   
          if(initialIndex == scoresArr.length - 1){
            finishAnalyzing = true;
          }else{
            Map<String,dynamic> lowerScore = scoresArr[initialIndex+1];
            final newNumber = lowerScore['number'] +3;
            double newAverage = ((unconditionalCreditsLeftExcludingDissertation - newNumber) * initialScoreToStart + newNumber * lowerScore['score']) / unconditionalCreditsLeftExcludingDissertation;
            if(newAverage >= averageTargetScore){
                scoresArr = [...scoresArr].asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String,dynamic> value = entry.value;
                  return index == initialIndex + 1 ? {...value,"number":newNumber} : value;
                }).toList();

                scoresArr = [...scoresArr].asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String,dynamic> value = entry.value;
                  return index == initialIndex ? {...value,"number":unconditionalCreditsLeftExcludingDissertation - newNumber} : value;
                }).toList();
            }else{
                finishAnalyzing = true;
            }
          }
      }else if (isGoingUpFirst == 1){
          if(initialIndex == 0){
              finishAnalyzing = true;
          }else{
              Map<String,dynamic> higherScore = scoresArr[initialIndex-1];
              final newNumber = (higherScore['number'] +3);
              double newAverage = ((unconditionalCreditsLeftExcludingDissertation - newNumber) * initialScoreToStart + newNumber * higherScore['score']) / unconditionalCreditsLeftExcludingDissertation;
              
              scoresArr = [...scoresArr].asMap().entries.map((entry) {
                int index = entry.key;
                Map<String,dynamic> value = entry.value;
                return index == initialIndex -1 ? {...value,"number":newNumber} : value;
              }).toList();

              scoresArr = [...scoresArr].asMap().entries.map((entry) {
                int index = entry.key;
                Map<String,dynamic> value = entry.value;
                return index == initialIndex ? {...value,"number":unconditionalCreditsLeftExcludingDissertation - newNumber} : value;
              }).toList();
              
              if(newAverage <= averageTargetScore){
                  finishAnalyzing = false;
              }else{
                  finishAnalyzing = true;
              }
          }
      }else{
          finishAnalyzing= true;
      }
    }

    return scoresArr.where((element) => element['number'] > 0).toList();
  }
}