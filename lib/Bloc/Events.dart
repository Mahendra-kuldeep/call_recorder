import 'dart:html';

import 'package:call_recorder/Model.dart';

abstract class callEvents {}

class addStudentsDetails extends callEvents{
  CallModel callModel;
  addStudentsDetails({required this.callModel});
}

class fatchStudetsDetails extends callEvents{}

class updateStudentDetails extends callEvents{
  int? studentId;
  String? studentName;
  String? studentPhone;
  AudioElement? callRocors;
  updateStudentDetails({this.studentId,this.studentName,this.studentPhone,this.callRocors});
}

class deleteStudentsDetails extends callEvents{
  int? studentId;
  deleteStudentsDetails({this.studentId});
}
