import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";


void main() => runApp(MaterialApp(home: MyHomePage()));

class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text("Tech Post", style: TextStyle(),),
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('post').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            const Text("Loading");
          }
          else {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index){
                DocumentSnapshot mypost = snapshot.data.documents[index];
                return Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 350.0,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Material(
                              color: Colors.white,
                              elevation: 14.0,
                              shadowColor: Color(0X802196F3),
                              child: Center(child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 200.0,
//                                        child: Image.network(
//                                          '${mypost['image']}',
//                                          fit: BoxFit.fill,
//                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      Text('${mypost['title']}',
                                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10.0),
                                      Text('${mypost['subtitle']}',
                                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
            );
          }
          return null;
        }
      ),
    );
  }
  
}