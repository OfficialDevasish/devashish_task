import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'EmployeeUpdate.dart';

class ViewEmployee extends StatefulWidget {
  @override
  State<ViewEmployee> createState() => _ViewEmployeeState();
}

class _ViewEmployeeState extends State<ViewEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("ViewEmployee"),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Employee").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.size <= 0) {
              return Center(
                child: Text("no data"),
              );
            } else {
              return ListView(
                children: snapshot.data!.docs.map((documents) {
                  return Container(
                    color: Colors.blue.shade100,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [

                            Container(
                              margin: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    documents["firstname" ].toString().toUpperCase(),
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "lastname: " + documents["lastname"],
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "email: " + documents["email"],
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "password: " + documents["password"],
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "confirm_password: " + documents["confirm_password"],
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                var docid = documents.id.toString();

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EmployeeUpdate(
                                          docid: docid,
                                          Employee: null,
                                        )));
                              },
                              child: Text("Update"),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                AlertDialog alert = AlertDialog(
                                  title: Text(
                                    "Warning",
                                    style: TextStyle(color: Colors.red, fontSize: 25),
                                  ),
                                  content: Text("Are You Sure You want to Delete"),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () async {
                                        var docid = documents.id.toString();

                                        await FirebaseStorage.instance.ref(documents["imagename"]).delete().then((value) async {
                                          await FirebaseFirestore.instance.collection("Employee").doc(docid).delete().then((value) {
                                            Navigator.of(context).pop();
                                          });
                                        });
                                      },
                                      child: Text("Yes"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("No"),
                                    ),
                                  ],
                                );
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert;
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(primary: Colors.red),
                              child: Text("Delete"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
