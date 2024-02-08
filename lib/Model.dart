import 'dart:html';

import 'package:call_recorder/DbHelper.dart';

class CallModel{
  String? userId;
  String? studentName;
  AudioElement? callRecords;
  String? PhoneNumber;

  CallModel({this.userId,required this.studentName,this.callRecords,required this.PhoneNumber});

  factory CallModel.fromMap(Map<String,dynamic>map){
    return CallModel(userId: map[DbHelper.student_Id],studentName:map[DbHelper.studentName],callRecords: map[DbHelper.student_callrcords],PhoneNumber: map[DbHelper.student_phone]);
  }

  Map<String,dynamic>toMap(){
    return {
      DbHelper.student_Id:userId,
      DbHelper.studentName:studentName,
      DbHelper.student_phone:PhoneNumber,
      DbHelper.student_callrcords:callRecords
    };
  }
}