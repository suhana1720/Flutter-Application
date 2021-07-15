import 'package:fashion_shop/common/change_screen.dart';
import 'package:fashion_shop/common/loading.dart';
import 'package:fashion_shop/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fashion_shop/pages/home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>(); // for taking names nd all from form
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();

  bool hidePassword = true;


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: user.status == Status.Authenticating ? Loading() : Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[350],
                      blurRadius:
                      20.0,
                    )
                  ]
              ),
              child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            'images/logo.jpg', width: 260.0,),),
                      ),
                      //================name
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.2),
                          elevation: 0.0,
                          child:
                          Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                    controller: _nameTextController,
                                    decoration: InputDecoration(
                                        hintText: " full name",
                                        icon: Icon(Icons.person_outline),
                                        border: InputBorder.none),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "The name field cannot be empty";
                                      }
                                      return null;
                                    }
                                ),
                              )
                          ),
                        ),
                      ),

                      //===============================

                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.2),
                          elevation: 0.0,
                          child:
                          Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _emailTextController,
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      icon: Icon(Icons.email),
                                      border: InputBorder.none
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Pattern pattern =
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regex = new RegExp(pattern);
                                      if (!regex.hasMatch(value))
                                        return 'Please make sure your email address is valid';
                                      else
                                        return null;
                                    }
                                  },

                                ),
                              )
                          ),
                        ),
                      ),

                      // password----------------------------
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.2),
                          elevation: 0.0,
                          child:
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                  controller: _passwordTextController,
                                  obscureText: hidePassword,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      icon: Icon(Icons.lock_outline),
                                      border: InputBorder
                                          .none // underline not show
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The password field cannot be empty";
                                    } else if (value.length < 6) {
                                      return "the password has to be at least 6 characters long";
                                    }
                                    return null;
                                  }
                              ),
                              trailing: IconButton(
                                  icon: Icon(Icons.remove_red_eye,),
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  }),
                            ),
                          ),
                        ),
                      ),

                      //button=================

                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.black,
                          elevation: 0.0,
                          child: MaterialButton(onPressed: () async {
                                         if(_formKey.currentState.validate()) {
                                           if (!await user.signUp(
                                               _nameTextController.text,
                                               _emailTextController.text,
                                               _passwordTextController.text)) {
                                             _key.currentState.showSnackBar(
                                                 new SnackBar(content: Text(
                                                     "Sign up failed")));
                                             return;

                                           }
                                           changeScreen(context, Homepage());

                                         }
                                         },

                              minWidth: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: Text(
                                "Sign up",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              )

                          ),
                        ),
                      ),
                      //=======================

                      //=======================
                      Padding(padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("I already have an account",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.deepOrange,
                                    fontSize: 16),))
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),


    );

  }

}

