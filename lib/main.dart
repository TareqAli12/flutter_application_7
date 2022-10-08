

import 'dart:developer';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/task_managment/main_tasks_screen.dart';
void main(List<String> args) {
  
  runApp(MaterialApp(
    home: MainTaskScreen(),
  ));
}

class MyPostScreen extends StatefulWidget {
  const MyPostScreen({super.key});

  @override
  State<MyPostScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen> {
  List<String> comment=[];
  String content='';
  bool isDark = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log('initState method');
    isDark = true;
  }

  @override
  Widget build(BuildContext context) {
    log('build method');
    return Theme(
      data: isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('GSK west bank'),
          ),
          body: ListView(

            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('images/img1.jpg'),
                      radius: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Ahmed Hassan'),
                          Text('Since 23 minuites')
                        ],
                      ),
                    ),
                    CupertinoSwitch(
                      value: isDark,
                      onChanged: (d) {
                        isDark = d;
                        setState(() {});
                      },
                    )
                  ],
                ),
              ),
              Container(
                height: 400,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/img2.jpg'))),
              ),
              Container(
                  margin: const EdgeInsets.all(10), child: IsLikedButton()),
              const Text('Hello this is my first post'),
              const Text('Add Comment'),
              const SizedBox(
                height: 5,
              ),

              Row(
                children:[ 
                Expanded(
                  child: TextField(
                    onChanged: (v){
                      content =v;
                    } ,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Container(
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      comment.add(content);
                      setState(() {});
                    },
                    child: const Icon(Icons.send)
                    ),
                ),
            ]),
            ...comment.map((e) {
              return Text(e);
            }).toList(),
              //AcceptConditions()
            ],
          )),
    );
  }
}

class AcceptConditions extends StatefulWidget {
  const AcceptConditions({super.key});

  @override
  State<AcceptConditions> createState() => _AcceptConditionsState();
}

class _AcceptConditionsState extends State<AcceptConditions> {
  bool isAccepted = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Checkbox(
              value: isAccepted,
              onChanged: (value) {
                isAccepted = value!;
                setState(() {});
              }),
          const SizedBox(
            width: 10,
          ),
          Text('Accept Conditions')
        ],
      ),
    );
  }
}

class IsLikedButton extends StatefulWidget {
  const IsLikedButton({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return IsLikedButtonState();
  }
}

class IsLikedButtonState extends State<IsLikedButton> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        isLiked = !isLiked;

        setState(() {});
      },
      child: Icon(
        Icons.favorite,
        size: 80,
        color: isLiked ? Colors.red : Colors.grey,
      ),
    );
  }
}
