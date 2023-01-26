class TadaConfig{
  static List<Map<String,dynamic>> grades = [
    {"value":1,"label": 'Xuất sắc'},
    {"value":2,"label": 'Giỏi'},
    {"value":3,"label": 'Khá'},
    {"value":4,"label": 'Trung bình'},
  ];

  static List<Map<String,dynamic>> tenCreditsLeft = [
    {"value":1,"label": 'Luận văn',"credit": 10},
    {"value":2,"label": 'Tiểu luận và các học phần khác',"credit":4},
    {"value":3,"label": 'Học phần ngoài luận văn và tiểu luận',"credit":0}
  ];

  static Map<String,double> thresholdTitle = {
    "1":3.6,
    "2":3.2,
    "3":2.5,
    "4":2.0,
  };

  static List<Map<String,dynamic>> scoresList = [
    {"type":1,"number":0,"score":4,"des":"A"},
    {"type":2,"number":0,"score":3.5,"des":"B+"},
    {"type":3,"number":0,"score":3,"des":"B"},
    {"type":4,"number":0,"score":2.5,"des":"C+"},
    {"type":5,"number":0,"score":2,"des":"C"},
    {"type":6,"number":0,"score":1.5,"des":"D+"},
    {"type":7,"number":0,"score":1,"des":"D"},
  ];
  
  static List<double> allScoreLevels = [4, 3.5, 3, 2.5, 2, 1.5, 1];

  static List<String> validScoreType = ["M","A","B+","B","C+","C","D+","D","F"];

  static List<int> validCredit = [1,2,3,4,10];

  static Map<String,num> changeTypeToScore = {
    "A":4,
    "B+":3.5,
    "B":3,
    "C+":2.5,
    "C":2,
    "D+":1.5,
    "D":1
  };

}