import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

String defualt_question_image =
    "https://highlandcanine.com/wp-content/uploads/2021/01/vizsla-running.jpg";

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final questionController = TextEditingController();
  final solutionController = TextEditingController();
  String questionText = '';
  String solutionText = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Image.network(
                  questionText.isEmpty ? defualt_question_image : questionText),
              TextField(
                controller: questionController,
              ),
              TextField(
                controller: solutionController,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      questionText = questionController.text;
                      solutionText = solutionController.text;
                    });
                  },
                  child: Text("Sussy Baka"))
            ],
          ),
        ),
      ),
    );
  }
}
