import 'package:flutter/material.dart';
import 'package:tada_score_analysis/config.dart';
import 'package:tada_score_analysis/controllers/home_controller.dart';
import 'package:tada_score_analysis/screens/Home/widgets/dropdown_textfield.dart';
import 'package:tada_score_analysis/screens/Home/widgets/number_textfield.dart';

class InputsOfHomeScreen extends StatefulWidget {
  const InputsOfHomeScreen({Key? key}) : super(key: key);

  @override
  State<InputsOfHomeScreen> createState() => _InputsOfHomeScreenState();
}

class _InputsOfHomeScreenState extends State<InputsOfHomeScreen> {

  @override
  void initState() {
    super.initState();
    _accumulatedAvarageScoreController.text = '3.73';
    _totalCreditsController.text = '141';
    _currentAccumulatedCreditsController.text = '105';
    _conditionalCreditsController.text = '24';
    _unfinishedConditionalCreditsController.text = '1';
    _failedCreditsController.text = '0';
  }

  final TextEditingController _accumulatedAvarageScoreController = TextEditingController();
  final TextEditingController _totalCreditsController = TextEditingController();
  final TextEditingController _currentAccumulatedCreditsController = TextEditingController();
  final TextEditingController _conditionalCreditsController = TextEditingController();
  final TextEditingController _unfinishedConditionalCreditsController = TextEditingController();
  final TextEditingController _failedCreditsController = TextEditingController();

  int isDissertation = 1;
  int type = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Column(
        children: [
          NumberTextFieldForHomePage(
            inputController:_accumulatedAvarageScoreController,
            title:"Điểm trung bình tích lũy từ hệ thống học tập",
            isDecimal:true,
            hintText:"3.73"
          ),
          NumberTextFieldForHomePage(
            inputController:_totalCreditsController,
            title:"Tổng tín chỉ của ngành",
            isDecimal:false,
            hintText:"141"
          ),
          NumberTextFieldForHomePage(
            inputController:_currentAccumulatedCreditsController,
            title:"Tổng tín chỉ tích lũy hiện tại",
            isDecimal:false,
            hintText:"105"
          ),
          NumberTextFieldForHomePage(
            inputController:_conditionalCreditsController,
            title:"Tổng tín chỉ các học phần điều kiện",
            isDecimal:false,
            hintText:"24"
          ),
          NumberTextFieldForHomePage(
            inputController:_unfinishedConditionalCreditsController,
            title:"Tổng tín chỉ các học phần điều kiện chưa tích lũy",
            isDecimal:false,
            hintText:"1"
          ),
          NumberTextFieldForHomePage(
            inputController:_failedCreditsController,
            title:"Tổng tín chỉ các học phần đã bị điểm F",
            isDecimal:false,
            hintText:"0"
          ),
          DropDownTextFieldForHomePage(
            title:"10 chỉ cuối cùng bạn chọn làm",
            updateStateOfTheDropDown:(int value){setState((){isDissertation = value;});},
            inputValue: isDissertation,
            listOfDropDownItems:TadaConfig.tenCreditsLeft,
          ),
          DropDownTextFieldForHomePage(
            title:"Xếp loại mong muốn",
            updateStateOfTheDropDown:(int value){setState((){type = value;});},
            inputValue: type,
            listOfDropDownItems:TadaConfig.grades,
          ),
          // Button to initiate analyzing
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top:20),
                padding: const EdgeInsets.symmetric(vertical:20,horizontal:0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation:10,
                      padding: const EdgeInsets.all(20),
                      backgroundColor: const Color(0xFF3a7190),
                    ),
                    onPressed:()=>{
                      HomeController.handleStartAnalyzing(
                        totalCredits: _totalCreditsController.text, 
                        accumulatedCredits: _currentAccumulatedCreditsController.text, 
                        averageAccumulatedScores:_accumulatedAvarageScoreController.text, 
                        conditionalCredits: _conditionalCreditsController.text, 
                        failedCredits: _failedCreditsController.text, 
                        unfinishedConditionalCredits: _unfinishedConditionalCreditsController.text,
                        isDissertation: isDissertation,
                        type:type,
                        context:context,
                      ),
                    },
                    child: const Text('Bắt đầu phân tích', style: TextStyle(fontSize:18))
                  ),
                ),
              ),
              const SizedBox(height:30),
            ],
          )
        ],
      ),
    );
  }
}