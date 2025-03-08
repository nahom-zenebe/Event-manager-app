import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/auth/presentation/UI/loginpage.dart';
import 'package:myapp/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:myapp/features/auth/presentation/bloc/auth/auth_event.dart';
import 'package:myapp/features/auth/presentation/bloc/auth/auth_state.dart';
import '../../../../features/Event/presentation/pages/home_display.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void submitvalidate() {
      if (_formkey.currentState!.validate()) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Form Validated')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Please fix the errors')));
      }
    }

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Center(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Icon(
                    Icons.event_note,
                    color: Colors.blueAccent,
                    size: 50,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Create Account",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 30,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                        controller: namecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please provide all necessary information";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "john doe",
                            labelText: "Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please provide all necessary information";
                          } else if (!value.contains('@') ||
                              !value.endsWith('.com')) {
                            return "Please enter a valid email address with '@' and '.com'";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "exmaple@gmail.com",
                            labelText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "Please provider all neccessary information";
                          }
                        },
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        obscureText: true),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                        controller:roleController,
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "Please provider all neccessary information";
                          } else if (value.toLowerCase() != "user" ||
                              value.toLowerCase() != "admin") {
                            return "please insert ethier user or admmin";
                          }
                        },
                     
                        decoration: InputDecoration(
                            labelText: "Role",
                            hintText: "user or admin",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        obscureText: true),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      submitvalidate();
                      context.read<AuthBloc>().add(SignupEvent(
                          name: namecontroller.text,
                          email: emailController.text,
                          password: passwordController.text,
                          role: roleController.text));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeDisplay()));
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(430, 50),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: state is AuthLoading
                        ? CircularProgressIndicator()
                        : Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    child: Text(
                      "Already have a account click here",
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
