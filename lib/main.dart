import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:notes_app/mycontroller.dart';
import 'package:notes_app/note.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.pink[800], foregroundColor: Colors.white)),
    debugShowCheckedModeBanner: false,
    home: Dashboard(),
  ));
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Mycontroller m = Get.put(Mycontroller());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    m.get_select();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text(
            "Note App",
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        floatingActionButton: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Notes();
                },
              ));
            },
            child: Icon(Icons.library_add, color: Colors.pink[800], size: 40)),
        body: Obx(() => GridView.builder(
              itemCount: m.l.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Card(
                    margin: EdgeInsets.all(25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Container(
                            decoration: UnderlineTabIndicator(
                                borderSide: BorderSide(
                                    color: Colors.black, strokeAlign: 9)),
                            margin: EdgeInsets.all(5),
                            child: Text(
                              '${m.l.value[index]['note']}',
                              style: TextStyle(
                                  // decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              margin: EdgeInsets.all(5),
                              child: Text(
                                "${m.l.value[index]['name']}",maxLines: 1,
                                textAlign: TextAlign.center,
                              )),
                          SizedBox(height: 30,),
                          Row(crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                             

                              InkWell(onTap: () {
                                  m.get_delete(m.l.value[index]['id']);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return Dashboard();
                                  },));
                              },child: Icon(Icons.delete_forever,color: Colors.grey))
                            ],
                          )
                        ],
                      ),
                    ));
              },
            )));
  }
}
