import 'package:bloc/bloc.dart';
import 'package:call_recorder/Bloc/BlocState.dart';
import 'package:call_recorder/Bloc/Events.dart';
import 'package:call_recorder/DbHelper.dart';
import 'package:call_recorder/Model.dart';

class callBloc extends Bloc<callEvents,callStates>{
  DbHelper myDb;
  callBloc({required this.myDb}) :super(initialState()){
    on<addStudentsDetails>((event, emit)async{
      emit(laodingState());
      final checkstudents = await myDb.inserallstudents(event.callModel);
      if(checkstudents){
        final studentDetailList = await myDb.getData();
        emit(loadedState(callHistroy: studentDetailList));
      }
    });

    on<fatchStudetsDetails>((event, emit)async{
      emit(laodingState());
      final studentDetailList = await myDb.getData();
      emit(loadedState(callHistroy: studentDetailList));
    });
    on<deleteStudentsDetails>((event, emit)async{
      emit(laodingState());
      await myDb.deletestudent(event.studentId!);
      final studentDetailList = await myDb.getData();
      emit(loadedState(callHistroy: studentDetailList));
    });
    on<updateStudentDetails>((event, emit)async{
      emit(laodingState());
      await myDb.updatestudentsDetails(CallModel(studentName: event.studentName, PhoneNumber: event.studentPhone,));
      final studentDetailList = await myDb.getData();
      emit(loadedState(callHistroy: studentDetailList));
    });
  }
}