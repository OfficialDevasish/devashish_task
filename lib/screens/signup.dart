import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devashish_task/screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../services/loadershowhide.dart';

class signup extends StatefulWidget {
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  bool _isload = false;
  String? gender;

  final db = FirebaseFirestore.instance.collection("EmployeeModel");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Sign In Screen"),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "First Name",
              ),

              TextFormField(
                controller: _firstname,
                decoration: InputDecoration(

                  labelText: "Enter First Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),

                  ),

                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Za-zA-Z]+[a-zA-Z]+[a-zA-Z]+")
                          .hasMatch(value)) {
                  }
                },
              ),
              const Text(
                "Last Name",
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _lastname,
                decoration: InputDecoration(
                  labelText: "Enter Last Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
              const Text(
                "Email",
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _email,
                decoration: InputDecoration(
                  labelText: "Enter Email Id",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),

                onFieldSubmitted: (value) {
                  //Validator
                },
                validator: (value) {
                  if (value!.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },

                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Password",
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _password,

                // onFieldSubmitted: (value) {
                //   //Validator
                // },
                // validator: (value) {
                //   if (value!.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)) {
                //     return 'Enter a valid Password!';
                //   }
                //   return null;
                // },
                decoration: InputDecoration(
                  labelText: "Enter Password as Abc@123",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
              const Text(
                "Confirm Password",
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _confirmpassword,
                // onFieldSubmitted: (value) {
                //   //Validator
                // },
                // validator: (value) {
                //   if (value!.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)) {
                //     return 'Enter a valid Password!';
                //   }
                //   return null;
                // },
                decoration: InputDecoration(
                  labelText: "Enter Password as Abc@123",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Please Select Your Gender"),
              RadioListTile(
                title: const Text("Male"),
                value: "male",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text("Female"),
                value: "female",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text("Other"),
                value: "other",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {



                    // setState(() {
                    //   const SizedBox(
                    //
                    //     child: CircularProgressIndicator(),
                    //     height: 10.0,
                    //     width: 10.0,
                    //   );
                    //
                    //   _isload = true;
                    //   if (_formkey.currentState!.validate()) {
                    //     print("successful");
                    //     return;
                    //   } else {
                    //     print("UnSuccessfull");
                    //   }
                    // });

                    var firstname = _firstname.text.toString();
                    var lastname = _lastname.text.toString();
                    var email = _email.text.toString();
                    var pass = _password.text.toString();
                    var cpass = _confirmpassword.text.toString();

                    FirebaseFirestore.instance
                        .collection('EmployeeModel')
                        .add({'firstname': firstname,'lastname': lastname,'email':email,'password':pass,'confirm_password':cpass,});

                    Uri url = Uri.parse("https://ecommerce.tecocraft.net/api/v1/register");
                    Map<String, String> parms = {"firstname":firstname,"lastname": lastname, "email": email, "password": pass, "confirm_password": cpass};
                    var header = {"Content-Type": "application/json"};

                    var response = await http.post(url, body: parms);
                    if (response.statusCode == 200) {
                      var json = jsonDecode(response.body);
                      if (json["result"] == "success") {


                        Fluttertoast.showToast(
                            msg: "successful",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        var firstname = json["data"]["firstname"];
                        var lastname = json["data"]["lastname"];
                        var email = json["data"]["email"];
                        var pass = json["data"]["password"];
                        var cpass = json["data"]["confirm_password"];

                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString("firstname", firstname.toString());
                        prefs.setString("lastname", lastname.toString());
                        prefs.setString("email", email.toString());
                        prefs.setString("password", pass.toString());
                        prefs.setString("confirm_password", cpass.toString());
                        Navigator.of(context).pop();

                        setState(() {
                          _isload = false;
                        });

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>loginscreen())
                      );
                      }
                      else {
                        Fluttertoast.showToast(
                            msg: "Something Went Wrong",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                      }
                    }
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>loginscreen())
                    );

                  },
                  child: (_isload)? loadershowhide():const Text("Login"),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
