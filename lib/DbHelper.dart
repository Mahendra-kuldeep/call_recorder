import 'dart:html';
import 'dart:io';
import 'package:call_recorder/Model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper{
  DbHelper._();
  static final DbHelper myDb = DbHelper._();
  Database? _database;
  static const studentDetails="Userdetails";
  static const studentName="studentName";
  static const student_Id ="studentid";
  static const student_phone="studentphone";
  static const student_callrcords = "studentcall";

  Future<Database>getDb()async{
    if(_database!=null){
      return _database!;
    }
    else{
      return await initDb();
    }
  }
  Future<Database>initDb()async{
    Directory directory = await getApplicationDocumentsDirectory();
    var dbpath=join(directory.path+"notedb.db");
    return await openDatabase(dbpath,version: 1,onCreate: (db,version){
      return db.execute("Create table $studentDetails ( $student_Id integer primary key autoincrement , $student_phone integer ,$student_callrcords AudioElement)");
    });
  }
  inserallstudents(CallModel callModel)async{
    var db = await myDb.getDb();
    await db.insert(studentDetails,callModel.toMap());
  }
  Future<List<CallModel>>getData()async{
    var db = await myDb.getDb();
    List<CallModel>noteList=[];
    var data =  await db.query(studentDetails);
    for(Map<String,dynamic>eachData in data){
      CallModel notesModel = CallModel.fromMap(eachData);
      noteList.add(notesModel);
    }
    return noteList;
  }
  Future<bool>deletestudent(int studentId)async{
    var db = await myDb.getDb();
    var count = await db.delete(studentDetails,where:"$student_Id =?", whereArgs: [studentId]);
    return count>0;
  }
  Future<bool> updatestudentsDetails(CallModel calls)async{
    var db = await myDb.getDb();
    var count = await db.update(studentDetails,calls.toMap(), where: "$student_Id=${calls.userId}");
    return count>0;
  }
}