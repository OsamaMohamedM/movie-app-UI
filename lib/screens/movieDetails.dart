import 'package:flutter/material.dart';
import 'package:movie_project/Data/User.dart';
import 'package:movie_project/Widgets/shortcats.dart';
import '../Models/Movie.dart';
import '../Models/users.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;
  final User? user;

  const MovieDetails(this.movie, {this.user, super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    final isInWatchlist = (widget.user==null ? false :watchedListMap.containsKey(widget.user) &&
        watchedListMap[widget.user]!.contains(widget.movie));

    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ),
            const Text(
              "Back",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
        leadingWidth: 120,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "images/${widget.movie.ImageName}",
                      width: 150,
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildInfoSection("Director", widget.movie.Director),
                        buildInfoSection("Genre", widget.movie.Genre),
                        buildInfoSection("Year", widget.movie.YEAR),
                        buildInfoSection("Duration", widget.movie.Duration),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                widget.movie.tittle,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  ...List.generate(5, (index) {
                    return Icon(
                      index + 1 <= widget.movie.rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 24,
                    );
                  }),
                  const SizedBox(width: 8),
                  Text("(${widget.movie.rating})"),
                ],
              ),
              const SizedBox(height: 20),
              buildButton("Play", () {}, background: Colors.blue),
              const SizedBox(height: 10),
              buildButton("Download", () {}, background: Colors.blue),
              const SizedBox(height: 10),
              buildButton(
                isInWatchlist ? "Remove from Watchlist" : "Add to Watchlist",
                    () {
                  if(widget.user==null) {
                    return;
                  }
                  setState(() {
                    if (isInWatchlist) {
                      watchedListMap[widget.user]!.remove(widget.movie);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Movie removed from watchlist')),
                      );
                    } else {

                      watchedListMap[widget.user]!.add(widget.movie);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Movie added to watchlist')),
                      );
                    }
                  });
                },
                background: Colors.redAccent,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  widget.movie.Description,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoSection(String title, String info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          info,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget buildButton(String label, VoidCallback onPressed, {required Color background}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(label),
    );
  }
}
