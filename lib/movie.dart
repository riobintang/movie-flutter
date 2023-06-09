import 'package:flutter/material.dart';
import 'services/BaseNetwork.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detail_movies.dart';
import 'movieService.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  List<dynamic> topMovies = [];
  List<dynamic> allMovies = [];
  List<dynamic> searchResults = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchTopMovies();
    fetchAllMovies();
  }



  void fetchTopMovies() async {
    try {
      final movies = await MovieService.getTopMovies();
      setState(() {
        topMovies = movies;
      });
    } catch (e) {
      print(e);
    }
  }

  void fetchAllMovies() async {
    try {
      final movies = await MovieService.getAllMovies();
      setState(() {
        allMovies = movies;
      });
    } catch (e) {
      print(e);
    }
  }

  void searchMovie(String query) async {
    try {
      final results = await MovieService.searchMovies(query);
      setState(() {
        searchResults = results;
      });
    } catch (e) {
      print(e);
    }
  }

  void navigateToMovieDetail(
      String title,
      String posterPath,
      String originalTitle,
      String originalLanguage,
      String releaseDate,
      String overview) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailPage(
          title: title,
          posterPath: posterPath,
          originalTitle: originalTitle,
          originalLanguage: originalLanguage,
          releaseDate: releaseDate,
          overview: overview,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[200],
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search',
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () => searchMovie(searchController.text),
            ),
          ),
          onSubmitted: (value) => searchMovie(value),
        ),
      ),
      body: Container(
        color: Color.fromRGBO(0, 0, 0, 0.85),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Top Movies',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Set text color to white
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topMovies.length,
                  itemBuilder: (BuildContext context, int index) {
                    final movie = topMovies[index];
                    final title = movie['title'];
                    final posterPath = movie['poster_path'];
                    final originalTitle = movie['original_title'];
                    final originalLanguage = movie['original_language'];
                    final releaseDate = movie['release_date'];
                    final overview = movie['overview'];

                    return GestureDetector(
                      onTap: () => navigateToMovieDetail(title, posterPath,
                          originalTitle, originalLanguage, releaseDate, overview),
                      child: Container(
                        width: 120,
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  '$imagePath$posterPath',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white, // Set text color to white
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Movies List',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Set text color to white
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: searchResults.length > 0
                    ? searchResults.length
                    : allMovies.length,
                itemBuilder: (BuildContext context, int index) {
                  final movie = searchResults.length > 0
                      ? searchResults[index]
                      : allMovies[index];
                  final title = movie['title'];
                  final posterPath = movie['poster_path'];
                  final originalTitle = movie['original_title'];
                  final originalLanguage = movie['original_language'];
                  final releaseDate = movie['release_date'];
                  final overview = movie['overview'];

                  return ListTile(
                    leading: Image.network(
                      '$imagePath$posterPath',
                      width: 50,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white, // Set text color to white
                      ),
                    ),
                    onTap: () => navigateToMovieDetail(title, posterPath,
                        originalTitle, originalLanguage, releaseDate, overview),
                    
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}