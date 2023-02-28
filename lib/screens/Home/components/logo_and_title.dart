import 'package:flutter/material.dart';
import 'package:tada_score_analysis/screens/Instruction/instruction_page.dart';

class LogoAndTitle extends StatelessWidget {
  const LogoAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical:50),
      child: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo.png",width: 120, height: 120),
            const SizedBox(height:32),
            const Text("TaDa",
                style: TextStyle(
                color: Colors.white,
                fontSize:40,
                fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(height:24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation:10,
                padding: const EdgeInsets.all(20),
                backgroundColor: const Color(0xFF3a7190), // background
              ),
              onPressed:(){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context)=> const InstructionPage()
                  )
                );
              }, 
              child: const Text('Đọc hướng dẫn', style: TextStyle(fontSize:18))
            )
          ],
        )
      ),
    );
  }
}