import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/auth/presentation/UI/signuppage.dart';
import '../bloc/auth/auth_event.dart';
import '../bloc/auth/auth_state.dart';
import '../bloc/auth/auth_bloc.dart';
import '../../../../features/Event/presentation/pages/home_display.dart';

class LoginPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void validatesubmit() {
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
                    "Log Account",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 30,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 70,
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
                    height: 40,
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
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      validatesubmit();
                      context.read<AuthBloc>().add(LoginEvent(
                          email: emailController.text,
                          password: passwordController.text));
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
                      "Don't have a account click here",
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Signuppage()));
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
