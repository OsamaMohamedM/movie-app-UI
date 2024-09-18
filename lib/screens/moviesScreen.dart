import 'package:flutter/material.dart';
import 'package:movie_project/Data/Moives.dart';

import '../Data/User.dart';
import '../Models/Movie.dart';
import '../Models/users.dart';
import 'movieDetails.dart';

class MoviesScreen extends StatefulWidget {
  final User? user;
   const MoviesScreen({this.user,super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Movie App"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      generateContainer("Action", () {}),
                      generateContainer("Comedy", () {}),
                      generateContainer("Drama", () {}),
                      generateContainer("Horror", () {}),
                      generateContainer("Sci-Fi", () {}),
                      generateContainer("Romance", () {}),
                      generateContainer("Thriller", () {}),
                      generateContainer("Adventure", () {}),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Section("Featured Movies", () {}, futureMovies),
                Section("Trending Movies", () {}, trendingMovies),
                Section("New Movies", () {}, newMovies),
                Section("Top Rating Movies", () {}, topRating),
              ],
            ),
          ),
        ));
  }

  Widget generateContainer(String data, void Function() func) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: TextButton(
        onPressed: func,
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
            side: const BorderSide(
                color: Colors.blue, width: 1.0), // Border color and width
          ),
        ),
        child: Text(
          data,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget Section(String data, void Function() func, List<Movie>lst) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(data,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w400),),
            TextButton(
                onPressed: func, child: const Icon(Icons.arrow_forward)),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: lst.length,
            itemBuilder: (context, index) {
              return TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          MovieDetails(lst[index],user: widget.user )));
                },
                style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "images/${lst[index].ImageName}",
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}