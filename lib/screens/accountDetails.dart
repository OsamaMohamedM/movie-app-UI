import 'package:flutter/material.dart';
import '../Models/users.dart';

class accountDetails extends StatefulWidget {
  final User user;

  const accountDetails(this.user, {super.key});

  @override
  State<accountDetails> createState() => _accountDetailsState(user);
}

class _accountDetailsState extends State<accountDetails> {
  final User user;

  _accountDetailsState(this.user);

  final _formKey = GlobalKey<FormState>();

  bool obscureOldPassword = true;
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    String email = user.Email, phone = user.telphone, name = user.name;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Back",),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/${user.ImageName}"),
              ),
              const SizedBox(height:20),
              Form(
                key: _formKey,
                child: Column(
                  children: [

                    const SizedBox(height: 50),
                    const Text(
                      "Name",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      initialValue: user.name,
                      decoration: InputDecoration(
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
                    const SizedBox(height: 10),
                    const Text(
                      "Eamil",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      initialValue: user.email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Email';
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
                    const SizedBox(height: 10),
                    const Text(
                      "Telephone number",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      initialValue: user.Email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty ) {
                          return 'please enter your phone';
                        }
                        if(value.length!=11)
                          {
                            return 'please enter valid phone';
                          }
                        return null;
                      },
                      onChanged: (value) {
                        phone = value;
                      },
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          user.name = name;
                          user.Email=email;
                          user.telphone = phone;
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      child: const Text(
                        "Save",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
