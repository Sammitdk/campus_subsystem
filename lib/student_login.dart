import 'package:flutter/material.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({Key? key}) : super(key: key);
  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  static const String _title = 'Log In';
  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: const Text(_title)
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/icons/student_login.gif",
                    ),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Student',
                    style: TextStyle(fontSize: 20),
                  )),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 40,right: 40,bottom: 20),
                      child: TextFormField(
                        controller: nameController,
                        validator: (name) {
                          if(name == null || name.isEmpty){
                            return 'Enter Prn';
                          }
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'PRN NO',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 40,right: 40,bottom: 20),
                      child: TextFormField(
                        obscureText: true,
                        validator: (pswd){
                          if(pswd == null || pswd.isEmpty){
                            return 'Enter Password';
                          }
                        },
                        controller: passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),),
                          child: const Text('Sign In',style: TextStyle(fontSize: 20),),
                          onPressed: () {
                            if(formkey.currentState!.validate()){
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logging In')));
                              print("${passwordController.text} = ${nameController.text}  ");
                            }
                            setState(
                                    (){

                                }
                            );
                          },
                        )
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
