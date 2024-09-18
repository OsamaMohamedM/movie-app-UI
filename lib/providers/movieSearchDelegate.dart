import 'package:flutter/material.dart';
import 'package:movie_project/Models/Movie.dart';

import '../Data/Moives.dart';
import '../Data/User.dart';
import '../Models/users.dart';
import '../screens/movieDetails.dart';

class movieSearchDelegate extends SearchDelegate {
  User? user;
  movieSearchDelegate({this.user});
  Widget buildSearchDelegte() {
    return TextField(
      onChanged: (query) {},
      decoration: const InputDecoration(
          label: Text("Search"), border: OutlineInputBorder()),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Movie> result = allMovies
        .where(
            (movie) => movie.tittle.toLowerCase().contains(query.toLowerCase()))
        .toList();

    print(result.length);
    print(query);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
        mainAxisExtent: 200,
      ),
      itemCount: result.length,
      itemBuilder: (context, index) {
        return TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieDetails(result[index],user :user)));
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("images/${result[index].ImageName}",
                    fit: BoxFit.cover)));
      },
    );
  }
}
