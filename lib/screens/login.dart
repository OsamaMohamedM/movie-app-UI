import 'package:flutter/material.dart';
import 'package:movie_project/Data/User.dart';
import 'package:movie_project/screens/HomeProfile.dart';
import 'package:movie_project/screens/Sgin%20Up.dart';
import '../Models/users.dart';
import '../Widgets/shortcats.dart';
import '../main.dart';

User? chk(String name, String pass) {
  for (int i = 0; i < users.length; i++) {
    if (users[i].name == name && users[i].pass == pass) return users[i];
  }
  return null;
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String password = "";
  bool rememberMe = false;
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: const Text(
                    "Welcome Back, Log In!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 50),
                TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Name"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    name = value;
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Password"),
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
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.black,
                      value: rememberMe,
                      onChanged: (newValue) {
                        setState(() {
                          rememberMe = newValue!;
                        });
                      },
                    ),
                    const Text("Remember me"),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                buildButton("Log In", () {
                  if (_formKey.currentState?.validate() ?? false) {
                    User? user = chk(name, password);
                    if (user != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                         builder: (context) => MyApp(user: user),
                        ),
                      );
                    }
                  }
                }),
                const SizedBox(height: 30),
                buildButton("Log In with Google", () {}),
                const SizedBox(height: 10),
                buildButton("Log In with Facebook", () {}),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Do not have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const signUp()));
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


