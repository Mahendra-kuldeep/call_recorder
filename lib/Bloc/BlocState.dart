import 'package:call_recorder/Model.dart';

abstract class  callStates{}

class initialState extends callStates{}

class laodingState extends callStates{}

class loadedState extends callStates{
  List<CallModel>callHistroy = [];
  loadedState({required this.callHistroy});
}

class errorState extends callStates{
  String errorMessage;
  errorState({required this.errorMessage});
}