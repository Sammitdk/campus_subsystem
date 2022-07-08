import 'package:campus_subsystem/faculty/faculty_attendance.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FacultyAttendanceOption extends StatefulWidget {
  Map<String, dynamic> info = {};
  FacultyAttendanceOption({Key? key, required this.info}) : super(key: key);

  @override
  State<FacultyAttendanceOption> createState() =>
      _FacultyAttendanceOptionState();
}

class _FacultyAttendanceOptionState extends State<FacultyAttendanceOption> {
  String selectedsub = '';

  TimeOfDay time = const TimeOfDay(hour: 9, minute: 0);
  DateTime date = DateUtils.dateOnly(DateTime.now());

  void timePicker() async {
    print(time);
    final DateTime? selecteddate = await showDatePicker(
        context: context,
        initialDate: date,
        lastDate: DateTime(2030),
        firstDate: DateTime(2010)
    );
    // final TimeOfDay? selectedtime = await showTimePicker(context: context,initialTime: time);
    if (selecteddate != null) {
      // time = selectedtime;
      date = selecteddate;
    }
    print(time);
    print(date);
  }

  @override
  Widget build(BuildContext context) {
    // print('${widget.info} sssssssssssssssssssssssssssssssssssss');
    List subjects = widget.info['Subjects'].keys.toList();
    // return Container();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Attendance",
          style: TextStyle(fontFamily: 'Narrow', fontSize: 30),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.indigo[300],
      ),
      body: Form(
        child: Column(
          children: [
            Container(
              margin:
                  const EdgeInsetsDirectional.only(start: 15, top: 70, end: 15),
              alignment: Alignment.center,
              height: 80,
              child: DropdownButtonFormField<String>(
                alignment: AlignmentDirectional.center,
                value: null,
                items: subjects
                    .map<DropdownMenuItem<String>>(
                        (value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                    .toList(),
                onChanged: (newvalue) {
                  selectedsub = newvalue!;
                  print(widget.info['Subjects'][selectedsub]);
                },
              ),
            ),
            // Container(
            //   margin: const EdgeInsetsDirectional.only(
            //       start: 15, top: 30, end: 15),
            //   alignment: Alignment.center,
            //   height: 80,
            //   child: DropdownButtonFormField<String>(
            //     alignment: AlignmentDirectional.center,
            //     value: selectedyear,
            //     items: year.map<DropdownMenuItem<String>>((String br) =>
            //         DropdownMenuItem<String>(value: br, child: Text(br)))
            //         .toList(),
            //     onChanged: (newvalue) {
            //       selectedyear = newvalue!;
            //     },
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsetsDirectional.only(
            //       start: 15, top: 30, end: 15, bottom: 40),
            //   alignment: Alignment.center,
            //   height: 80,
            //   child: DropdownButtonFormField<String>(
            //     alignment: AlignmentDirectional.center,
            //     value: selectedsem,
            //     items: sem.map<DropdownMenuItem<String>>((String br) =>
            //         DropdownMenuItem<String>(value: br, child: Text(br)))
            //         .toList(),
            //     onChanged: (newvalue) {
            //       selectedsem = newvalue!;
            //     },
            //   ),
            // ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle:
                    const TextStyle(fontFamily: 'MiliBold', fontSize: 18),
                onPrimary: Colors.black,
                primary: Colors.white,
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, left: 15, right: 15),
              ),
              onPressed: timePicker,
              child: const Text('Date'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle:
                    const TextStyle(fontFamily: 'MiliBold', fontSize: 18),
                onPrimary: Colors.black,
                primary: Colors.white,
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, left: 15, right: 15),
              ),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => FacultyAttendance(
                        subject: widget.info['Subjects'][selectedsub],
                      ))),
              child: const Text('Next'),
            )
          ],
        ),
      ),
    );
  }
}
