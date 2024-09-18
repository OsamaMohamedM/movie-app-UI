import 'package:flutter/material.dart';
import 'package:movie_project/Data/User.dart';
import 'package:movie_project/main.dart';
import 'package:movie_project/screens/ChangePassword.dart';
import 'package:movie_project/screens/Settings.dart';
import 'package:movie_project/screens/WatchedList.dart';
import 'package:movie_project/screens/accountDetails.dart';

import '../Models/users.dart';
import '../Widgets/shortcats.dart';


class HomeProfile extends StatelessWidget {
  final User user;

  const HomeProfile(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 40,),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("images/${user.ImageName}"),
                ),
                const SizedBox(width: 90,),
              Text(
              user.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
              ],
            ),
            const SizedBox(height: 10),

            const SizedBox(height: 20),
            const SizedBox(height: 20),

            buildButton("Watchlist", () {Navigator.push(context, MaterialPageRoute(builder: (context)=>wathedList(watchedListMap[user]!)));}),
            buildButton("Change Password", () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Changepassword(user)));
            }),
            buildButton("Account Details", () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>accountDetails(user)));
            }),
            buildButton("Setting", () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Settings()));
            }),
            buildButton("Help", () {}),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade900,
                padding: const EdgeInsets.symmetric(
                    horizontal: 100, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) =>const MyApp(user: null,)),
                      (Route<dynamic> route) => false,
                );
              },
              child: const Text("Log Out"),
            ),
          ],
        ),
      ),
    );
  }
}
