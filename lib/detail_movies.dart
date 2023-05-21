  import 'package:flutter/material.dart';
  import '/movie.dart';
  import '../services/BaseNetwork.dart';

  class MovieDetailPage extends StatelessWidget {
    final String title;
    final String posterPath;
    final String originalTitle;
    final String originalLanguage;
    final String releaseDate;
    final String overview;

    const MovieDetailPage({
      Key? key,
      required this.title,
      required this.posterPath,
      required this.originalTitle,
      required this.originalLanguage,
      required this.releaseDate,
      required this.overview,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(title),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  '$imagePath$posterPath',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Original Title: $originalTitle',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Original Language: $originalLanguage',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Release Date: $releaseDate',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Overview',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        overview,
                        style: TextStyle(
                          fontSize: 16,
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