import 'package:flutter/material.dart';

class LogoAndTitleForResultPage extends StatelessWidget {
  const LogoAndTitleForResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical:50),
      child: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("logo.png",width: 120, height: 120),
            const SizedBox(height:32),
            const Text("Ping pong! Có kết quả rồi",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize:26,
                fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(height:24),
            const Text("Dưới đây là các điểm số tối thiểu cho các tín chỉ học phần không điểu kiện còn lại để đạt mục tiêu của bạn. Nếu bạn làm luận văn hoặc tiểu luận sẽ chia làm 3 trường hợp, nếu thiếu trường hợp nào thì có nghĩa ở trường hợp đó bạn không thể đạt mục tiêu.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.white,
                fontSize:18,
              ),
            )
          ],
        )
      ),
    );
  }
}