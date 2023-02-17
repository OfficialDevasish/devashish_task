import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class EmployeeUpdate extends StatefulWidget {
  var docid = "";

  EmployeeUpdate({required this.docid, required Employee});

  @override
  State<EmployeeUpdate> createState() => _EmployeeUpdateState();
}

class _EmployeeUpdateState extends State<EmployeeUpdate> {
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirm_password = TextEditingController();

  File imagefile = null!;
  ImagePicker _picker = ImagePicker();

  var oldimagename = "";
  var oldimagefileurl = "";

  getsingledata() async {
    await FirebaseFirestore.instance.collection("Product").doc(widget.docid).get().then((documents) async {
      setState(() {
        _firstname.text = documents["firstname"].toString();
        _lastname.text = documents["lastname"].toString();
        _email.text = documents["email"].toString();
        _password.text = documents["password"].toString();
        _confirm_password = documents["confirm_password"].toString() as TextEditingController;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getsingledata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("UpdateEmployee"),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {});
                    },
                    child: Text("Camera"),
                  ),
                ],
              ),
              Text(
                "First Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: _firstname,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Last Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: _lastname,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Email:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: _password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Confirm Password",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _confirm_password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    var firstname = _firstname.text.toString();
                    var lastname = _lastname.text.toString();
                    var email = _email.text.toString();
                    var password = _password.text.toString();
                    var confirm_password = _confirm_password.text.toString();

                    if (imagefile != null) {
                      await FirebaseStorage.instance.ref(oldimagename).delete().then((value) async {
                        var uuid = Uuid();
                        var filename = uuid.v4().toString() + ".jpg";

                        await FirebaseStorage.instance.ref(filename).putFile(imagefile).whenComplete(() {}).then((filedata) async {
                          await filedata.ref.getDownloadURL().then((fileurl) async {
                            await FirebaseFirestore.instance
                                .collection("Product")
                                .doc(widget.docid)
                                .update({"firstname": firstname, "lastname": lastname, "email": email, "password": password, "confirm_password": confirm_password, "imageurl": fileurl}).then((value) {
                              Navigator.of(context).pop();
                              _firstname.text = "";
                              _lastname.text = "";
                              _email.text = "";
                              _password.text = "";
                              _confirm_password.text = "";
                            });
                          });
                        });
                      });
                    } else {
                      await FirebaseFirestore.instance.collection("Product").doc(widget.docid).update({
                        "firstname": _firstname,
                        "lastname": _lastname,
                        "email": _email,
                        "password": _password,
                        "confirmpassword": _confirm_password,
                      }).then((value) {
                        Navigator.of(context).pop();
                      });
                    }
                  },
                  child: Text(
                    "Update",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
