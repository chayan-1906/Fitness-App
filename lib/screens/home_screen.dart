import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/screens/exercise_hub.dart';
import 'package:fitness_app/screens/exercise_start_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String apiUrl =
      'https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json';

  late ExerciseHub exerciseHub = ExerciseHub(exercises: []);

  @override
  void initState() {
    // TODO: implement initState
    getExercises();
    super.initState();
  }

  void getExercises() async {
    var response = await http.get(Uri.parse(apiUrl));
    var body = response.body;

    var decodedJson = jsonDecode(body);
    exerciseHub = ExerciseHub.fromJson(decodedJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Fitness App',
            style: TextStyle(
              fontFamily: 'RobotoSlab',
            ),
          ),
        ),
      ),
      body: Container(
        child: exerciseHub != null
            ? ListView(
                children: exerciseHub.exercises.map((e) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExerciseStartScreen(
                            exercises: e,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: e.id,
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: e.thumbnail,
                                    placeholder: (context, url) => Image(
                                      image:
                                          AssetImage("assets/placeholder.jpg"),
                                      fit: BoxFit.cover,
                                      height: 250,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    fit: BoxFit.cover,
                                    height: 250,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ],
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 250,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF000000),
                                      Color(0x00000000),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.center,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 250,
                              padding:
                                  EdgeInsets.only(left: 10.0, bottom: 16.0),
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                e.title,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontFamily: 'RobotoSlab',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )
            : LinearProgressIndicator(),
      ),
    );
  }
}
