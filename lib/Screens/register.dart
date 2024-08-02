// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace, deprecated_member_use, unused_local_variable, avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_18/Constants.dart';
import 'package:flutter_application_18/Screens/login.dart';
import 'package:flutter_application_18/widgets/custom_textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? email;

  String? password;

  String? userName;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 247, 247, 247),
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(33.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 64,
                      ),
                      MyTextField(
                        onChanged: (data) {
                          userName = data;
                        },
                        textInputTypee: TextInputType.text,
                        isPassword: false,
                        hinttexttt: 'Enter Your username : ',
                      ),
                      const SizedBox(
                        height: 33,
                      ),
                      MyTextField(
                        onChanged: (data) {
                          email = data;
                        },
                        textInputTypee: TextInputType.emailAddress,
                        isPassword: false,
                        hinttexttt: 'Enter Your Email : ',
                      ),
                      const SizedBox(
                        height: 33,
                      ),
                      MyTextField(
                        onChanged: (data) {
                          password = data;
                        },
                        textInputTypee: TextInputType.text,
                        isPassword: true,
                        hinttexttt: 'Enter Your password : ',
                      ),
                      const SizedBox(
                        height: 33,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            isLoading = true;
                            setState(() {});
                            try {
                              await registerUser();
                              showSnackBar(context, 'success');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            } on FirebaseAuthException catch (ex) {
                              if (ex.code == 'weak-password') {
                                showSnackBar(context, 'weak password');
                              } else if (ex.code == 'email-already-in-use') {
                                showSnackBar(context, 'email already exists ');
                              }
                            } catch (ex) {
                              showSnackBar(context, 'there was an error ');
                            }
                            isLoading = false;
                            setState(() {});
                          } else {}
                        },
                        child: Text(
                          'Register ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(KBTNgreen),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(12)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                      const SizedBox(
                        height: 33,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
            label: ' Undo', textColor: Colors.white, onPressed: () {}),
        backgroundColor: KBTNgreen,
        content: Text(message),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
