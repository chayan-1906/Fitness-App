import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/screens/exercise_hub.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExerciseScreen extends StatefulWidget {
  final Exercises exercises;
  final double seconds;

  const ExerciseScreen({required this.exercises, required this.seconds});

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  late bool _isCompleted = false;
  late int _elapsedSeconds = 0;
  late Timer timer;
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();

  @override
  void initState() {
    // TODO: implement initState
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (timer.tick == widget.seconds) {
          timer.cancel();
          setState(() {
            _isCompleted = true;
          });
          playAudio();
          Navigator.of(context).pop();
        }
        setState(() {
          _elapsedSeconds = timer.tick;
        });
      },
    );
    super.initState();
  }

  void playAudio() {
    audioCache.play('cheering1.mp3');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: widget.exercises.gif,
              placeholder: (context, url) => Image(
                image: AssetImage("assets/placeholder.jpg"),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: MediaQuery.of(context).size.width,
            ),
          ),
          _isCompleted != true
              ? SafeArea(
                  child: Container(
                    height: 50.0,
                    margin: EdgeInsets.only(
                      top: 30.0,
                    ),
                    alignment: Alignment.topCenter,
                    child: Text(
                      '$_elapsedSeconds / ${widget.seconds} S',
                      style: TextStyle(
                        fontFamily: 'RobotoSlab',
                        letterSpacing: 1.4,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : Container(),
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(
                top: 20.0,
                left: 20.0,
              ),
              child: IconButton(
                icon: Center(
                  child: Icon(
                    Icons.close,
                    color: Color(0xFF420516),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
