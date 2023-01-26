import 'package:flutter/material.dart';
import 'package:tada_score_analysis/screens/Home/components/all_inputs_of_page.dart';
import 'package:tada_score_analysis/screens/Home/components/logo_and_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("background.jpg"),
                fit: BoxFit.cover
              ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF043150).withOpacity(0.5),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  LogoAndTitle(),
                  InputsOfHomeScreen(),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}