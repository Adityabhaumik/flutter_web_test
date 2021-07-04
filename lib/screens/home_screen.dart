import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../utility/user.dart';

class home extends StatefulWidget {
  static const id = "home";

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  user myUser = user();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFFBBBB),
      appBar: AppBar(
        title: Text('ceribrium'),
      ),
      body: Center(
        child: Container(
          child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      onChanged: (value) {
                        myUser.Name = value;
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusColor: Colors.white,
                        border: OutlineInputBorder(
                            gapPadding: 6,
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: "Full name",
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field Cant Be Empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        myUser.Email = value;
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusColor: Colors.white,
                        border: OutlineInputBorder(
                            gapPadding: 6,
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field Cant Be Empty';
                        }
                        EmailValidator(
                            errorText: 'enter a valid email address');
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        myUser.phoneNumber = value;
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusColor: Colors.white,
                        border: OutlineInputBorder(
                            gapPadding: 6,
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: "Phone number",
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field Cant Be Empty';
                        }
                        if (value.length == 10) {
                          return null;
                        }

                        return 'Please recheck';
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        myUser.accountNymber = value;
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusColor: Colors.white,
                        border: OutlineInputBorder(
                            gapPadding: 6,
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: "Account number",
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field Cant Be Empty';
                        }
                        if (value.length > 9 && value.length < 28) {
                          return null;
                        }
                        return 'Please recheck';
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        myUser.IFSCcode = value;
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusColor: Colors.white,
                        border: OutlineInputBorder(
                            gapPadding: 6,
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: "IFSC Code",
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field Cant Be Empty';
                        }
                        if (value.length == 11) {
                          return null;
                        }
                        return 'Please Recheck';
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if(_formKey.currentState!.validate()){
              myUser.uploadToFirebase();
              _formKey.currentState!.reset();
            }

          },
          label: Text('upload')),
    );
  }
}
