import 'package:campus_subsystem/student/student_syllabus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class StudentNotes extends StatefulWidget {
  StudentNotes({Key? key,required info}) : super(key: key);
  Map<String,dynamic> info = {};


  @override
  State<StudentNotes> createState() => _StudentNotesState();
}

class _StudentNotesState extends State<StudentNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
          builder: (context ,AsyncSnapshot<QuerySnapshot> snapshot) {
            if(snapshot.hasData){
              // print("qqqqqqqqqqqqqqqqq${snapshot.data?.docs.isEmpty}");
              if(snapshot.data!.docs.isEmpty){
                return const Center(child: Text('Files Not Added.',style: TextStyle(color: Colors.grey,fontSize: 20),));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context,i){
                    QueryDocumentSnapshot x = snapshot.data!.docs[i];
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => LoadFirebasePdf(url: x['url'],)));
                      },
                      child: Expanded(
                        child: Padding(
                          padding:  const EdgeInsetsDirectional.all(10),
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
                              //         bottomStart:
                              //         Radius.circular(50)),
                              //     color: Colors.blue[100]),
                              child: Text((x["num"]),textAlign: TextAlign.center,style: const TextStyle(fontSize: 30),),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
              }
            }
            return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(size: 50, color: Colors.red));
          }
      ),
    );
  }

}


