import 'package:flutter/material.dart';
import 'package:movie_project/providers/movieSearchDelegate.dart';

import '../Models/users.dart';

class Search extends StatelessWidget {
  User? user;
   Search({this.user ,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      actions: [
        IconButton(onPressed: (){
        showSearch(context: context, delegate: movieSearchDelegate(user: user));

        }, icon: const Icon(Icons.search))
      ],
      ),
    );
  }
}
