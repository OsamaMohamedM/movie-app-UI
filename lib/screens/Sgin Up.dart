import 'package:flutter/material.dart';
import 'package:movie_project/Data/User.dart';
import 'package:movie_project/Models/users.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String name = "", email = "", password = "", confirmPassword = "", tel = "";
    bool obscure = true;
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: const Row(
            children: [
              Icon(Icons.arrow_back),
              SizedBox(
                width: 10,
              ),
              Text(
                'Back',
                style: TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        leadingWidth: 90,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Hello, Sign Up",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Name",style: TextStyle(fontSize: 20),),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        obscureText: obscure,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 3) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Eamil",style: TextStyle(fontSize: 20),),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        obscureText: obscure,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 3) {
                            return "Please enter your Eamil";
                          }
                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Telphone",style: TextStyle(fontSize: 20),),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        obscureText: obscure,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length != 11) {
                            return 'Please enter correct Telphone';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          tel = value;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Password",style: TextStyle(fontSize: 20),),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              (obscure ? Icons.visibility_off : Icons.visibility),
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            },
                          ),
                        ),
                        obscureText: obscure,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value != confirmPassword) {
                            return 'passwords does not match';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("confirm Password",style: TextStyle(fontSize: 20),),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscure ? Icons.visibility_off : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            },
                          ),
                        ),
                        obscureText: obscure,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value != password) {
                            return 'passwords does not match';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Text(
                            "By click sign up you are in agreement  of",
                            style: TextStyle(fontSize: 13),
                          ),
                          Text(
                            " the Term of Conditon",
                            style: TextStyle(fontSize: 15, color: Colors.blue),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 500,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                // Rounded corners
                                side: const BorderSide(
                                    color: Colors.blue,
                                    width: 1.0), // Border color and width
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                users.add(User(name, password, tel, email,""));
                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 25),
                            )),
                      )
                    ])),
          ],
        ),
      ),
    );
  }
}
