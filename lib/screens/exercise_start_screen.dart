import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/screens/exercise_hub.dart';
import 'package:fitness_app/screens/exercise_screen.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ExerciseStartScreen extends StatefulWidget {
  final Exercises exercises;

  const ExerciseStartScreen({required this.exercises});

  @override
  _ExerciseStartScreenState createState() => _ExerciseStartScreenState();
}

class _ExerciseStartScreenState extends State<ExerciseStartScreen> {
  double initialValue = 30;
  double minValue = 10;
  double maxValue = 60;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Hero(
        tag: widget.exercises.id,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: widget.exercises.thumbnail,
              placeholder: (context, url) => Image(
                image: const AssetImage("assets/placeholder.jpg"),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0F044C),
                    Color(0x00000000),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
            ),
            Positioned(
              bottom: 40.0,
              left: 0.0,
              right: 0.0,
              child: SizedBox(
                width: 200,
                height: 200,
                child: SleekCircularSlider(
                  appearance: const CircularSliderAppearance(),
                  onChange: (double value) {
                    initialValue = value.toInt().toDouble();
                  },
                  initialValue: initialValue,
                  min: minValue,
                  max: maxValue,
                  innerWidget: (v) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        '${v.toInt()} S',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'RobotoSlab',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExerciseScreen(
                        exercises: widget.exercises,
                        seconds: initialValue,
                      ),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Start Exercise',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'RobotoSlab',
                    ),
                  ),
                ),
                color: const Color(0xFFE83350),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                splashColor: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
