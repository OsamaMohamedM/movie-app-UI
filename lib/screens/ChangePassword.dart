import 'package:flutter/material.dart';
import '../Models/users.dart';

class Changepassword extends StatefulWidget {
  final User user;

  const Changepassword(this.user, {super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState(user);
}

class _ChangepasswordState extends State<Changepassword> {
  final User user;

  _ChangepasswordState(this.user);

  final _formKey = GlobalKey<FormState>();

  bool obscureOldPassword = true;
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    String newPassword = "", confirmPassword = "", oldPassword = "";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Back"),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        "Change Password",
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      "Current Password",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureOldPassword = !obscureOldPassword;
                            });
                          },
                          icon: Icon(obscureOldPassword ? Icons.visibility_off : Icons.visibility),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      obscureText: obscureOldPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value != user.pass) {
                          return 'Wrong password';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        oldPassword = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "New Password",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureNewPassword = !obscureNewPassword;
                            });
                          },
                          icon: Icon(obscureNewPassword ? Icons.visibility_off : Icons.visibility),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      obscureText: obscureNewPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value != confirmPassword) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        newPassword = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Confirm New Password",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureConfirmPassword = !obscureConfirmPassword;
                            });
                          },
                          icon: Icon(obscureConfirmPassword ? Icons.visibility_off : Icons.visibility),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      obscureText: obscureConfirmPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty || value != newPassword) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        confirmPassword = value;
                      },
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          user.pass = newPassword;
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
