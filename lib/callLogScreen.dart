import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';

class CallLogScreen extends StatefulWidget {
  const CallLogScreen({super.key});

  @override
  State<CallLogScreen> createState() => _CallLogScreenState();
}

class _CallLogScreenState extends State<CallLogScreen> {
  List<CallLogEntry> callLogs = [];
  @override
  void initState() {
    super.initState();
    _getCallLogs();
  }

  Future<void>_getCallLogs()async{
    Iterable<CallLogEntry>recordedCalls = await CallLog.get();
    setState(() {
      callLogs= recordedCalls.toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RECORDED CALLS",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView.builder(itemCount: callLogs.length,itemBuilder: (context,index){
       return ListTile(
          leading:const CircleAvatar(
            radius: 30,
            child: Icon(Icons.person),
          ),
         title: Text("Phone:${callLogs[index].number}"),
         subtitle: Text("Duration:${callLogs[index].duration}"),
        );
      }),
    );
  }
}
