import 'package:flutter/material.dart';
import 'package:movie_project/Data/User.dart';
import 'package:movie_project/Models/Movie.dart';
class wathedList extends StatelessWidget {
  List<Movie> _Movies = [];

  wathedList(this._Movies, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Row(
              children: [Icon(Icons.arrow_back), Text("Back")],
            )),
        leadingWidth: 120,
      ),
      body: ListView.builder(
          itemCount: _Movies.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Background Image
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("images/${_Movies[index].ImageName}",width: 200,height: 200,fit: BoxFit.cover,)
                  ),
                 const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                      _Movies[index].tittle,
                        style:
                            TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text('Director: ${_Movies[index].Director}'),
                      const SizedBox(height: 15),
                      Text('Genre: ${_Movies[index].Genre}'),
                      const SizedBox(height: 15),
                      Text('Year: ${_Movies[index].YEAR}'),
                      const SizedBox(height: 15),
                      Text('Duration: ${_Movies[index].Duration}'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.play_arrow),
                            onPressed: () {
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.download),
                            onPressed: () {
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
