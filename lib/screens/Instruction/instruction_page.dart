import 'package:flutter/material.dart';
import 'package:tada_score_analysis/screens/Result/components/return_to_home_button.dart';

class InstructionPage extends StatelessWidget {
  const InstructionPage({Key? key}) : super(key: key);

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
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top:50,bottom:20),
                    padding:const EdgeInsets.symmetric(horizontal:30,vertical:0),
                    child:const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mục đích của ứng dụng",style: TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.w600),),
                        SizedBox(height:16,),
                        Text("Ứng dụng giúp cho sinh viên Đại học Cần Thơ hoặc các sinh viên trường khác có cùng quy tắc tính điểm trung bình tích lũy biết được các điểm số tối thiểu của các tín chỉ còn lại để họ đạt được xếp loại tốt nghiệp mong muốn",textAlign: TextAlign.justify, style: TextStyle(color:Colors.white,fontSize:18)),

                        SizedBox(height:40),
                        Text("Giải thích từ ngữ",style: TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.w600),),
                        SizedBox(height:16,),
                        Text("Tổng tín chỉ của ngành là tổng tín chỉ đã tích lũy tối thiểu mà bạn được quyền xét tốt nghiệp",textAlign: TextAlign.justify, style: TextStyle(color:Colors.white,fontSize:18)),
                        SizedBox(height:16,),
                        Text("Các học phần điều kiện là các học phần mà điểm số không được tính vào điểm trung bình tích lũy như Giáo dục quốc phòng, Tin học, Thể dục thể chất, Anh văn hay Pháp văn căn bản,...",textAlign: TextAlign.justify, style: TextStyle(color:Colors.white,fontSize:18)),
                        SizedBox(height:16,),
                        Text("Các học phần điều kiện chưa tích lũy là các học phần điều kiện mà bạn chưa hoặc đang học, chưa được đánh dấu đã tích lũy trong hệ thống của trường",textAlign: TextAlign.justify, style: TextStyle(color:Colors.white,fontSize:18)),
                      
                        SizedBox(height:40),
                        Text("Thao tác sử dụng",style: TextStyle(color:Colors.white,fontSize:20,fontWeight:FontWeight.w600),),
                        SizedBox(height:16,),
                        Text("Hãy thay thế các số liệu mẫu có sẵn ở các ô thành các dữ liệu của bạn và nhấp nút \"Bắt đầu phân tích\". Các thông tin bạn cung cấp nên chính xác để tránh các sai sót khi xử lý dữ liệu",textAlign: TextAlign.justify, style: TextStyle(color:Colors.white,fontSize:18)),
                        SizedBox(height:16,),
                        Text("Ứng dụng có phân chia ra các trường hợp khi điểm luận văn hoặc tiểu luận đạt mức A, B+ và C. Khi đó bạn sẽ biết các tín chỉ còn lại trừ luận văn hoặc tiểu luận cần đạt tối thiểu bao nhiêu để đạt mục tiêu",textAlign: TextAlign.justify, style: TextStyle(color:Colors.white,fontSize:18)),
                        SizedBox(height:16,),
                        Text("Tuy rất ít nhưng kết quả vẫn sẽ có sai lệch do điểm trung bình lấy từ hệ thống quản lý đã được nhà trường làm tròn",textAlign: TextAlign.justify, style: TextStyle(color:Colors.white,fontSize:18)),
                      ]
                    )
                  ),
                  ReturnHomeButton(parentContext: context)
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}