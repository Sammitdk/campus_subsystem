import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../faculty/faculty_event_show.dart';

class StudentEvent extends StatefulWidget {
  StudentEvent({Key? key}) : super(key: key);

  @override
  State<StudentEvent> createState() => _StudentEventState();
}

class _StudentEventState extends State<StudentEvent> {

  Widget Event(){
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Events").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot>snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,i){
                  QueryDocumentSnapshot x = snapshot.data!.docs[i];
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ShowEvent(x: x,)));
                    },
                    child: Padding(
                      padding:  const EdgeInsetsDirectional.all(18),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        color: Colors.blue[100],
                        child: Container(
                          alignment: Alignment.center,
                          height: 80,
                          // width: 300,
                          // decoration:  BoxDecoration(
                          //     borderRadius:
                          //     const BorderRadiusDirectional.only(
                          //         topStart: Radius.circular(50),
                          //         topEnd: Radius.circular(50),
                          //         bottomEnd: Radius.circular(50),
                          //         bottomStart: Radius.circular(50)),
                          //     color: Colors.blue[100]),
                          child: Text((x['Title']),textAlign: TextAlign.center,style: const TextStyle(fontFamily: "Bold",fontSize: 30),),
                        ),
                      ),
                    ),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Event",style: TextStyle(fontFamily: 'Narrow', fontSize: 30),textAlign: TextAlign.center,),
        backgroundColor: Colors.indigo[300],
      ),
      body: Event(),
    );
  }
}
