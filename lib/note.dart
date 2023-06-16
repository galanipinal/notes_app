import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notes_app/main.dart';
import 'package:notes_app/mycontroller.dart';

class Notes extends StatefulWidget {


  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  Mycontroller m = Get.put(Mycontroller());
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();



  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Add Notes"),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                textAlign: TextAlign.start,
                "Add Tittle...",
                style: TextStyle(fontSize: 15, color: Colors.pink[800]),
              ),
              Card(
                child: Container(
                  // decoration: BoxDecoration(
                  //     color: Colors.pink[50],
                  //     border: Border.all(color: Colors.pink),
                  //     borderRadius: BorderRadius.circular(5)),
                  margin: EdgeInsets.all(10),
                  child: TextField(
                      cursorColor: Colors.pink[700],
                      autofocus: false,
                      textAlign: TextAlign.center,
                      controller: t1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      )),
                ),
              ),
              Text(
                textAlign: TextAlign.start,
                "Add Note...",
                style: TextStyle(fontSize: 15, color: Colors.pink[800]),
              ),
              Card(
                child: Container(
                  margin: EdgeInsets.all(10),
                  // decoration: BoxDecoration(
                  //     color: Colors.pink[50],
                  //     border: Border.all(color: Colors.),
                  //     borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    cursorColor: Colors.pink[700],
                    autofocus: false,
                    controller: t2,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 60.0),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {


                     if (t1.text != "" && t2.text != "") {
                  m.get_Database();
                  m.get_insert(t1.text, t2.text);

                  }

                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Dashboard();
                    },
                  ));
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.pink[800],
                  height: 40,
                  width: 80,
                  child: Text("ADD",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),

            ],
          ),
        ));

  }
}

