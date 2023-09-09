import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://ooxjfbdgdcchhofjumbg.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9veGpmYmRnZGNjaGhvZmp1bWJnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQxODIwOTQsImV4cCI6MjAwOTc1ODA5NH0.VclRpMJhzh76D1Z4rtikVnYKCbU-VxVBDly9D80Bpbg",
  );
  runApp(const MainApp());
}

final supabase = Supabase.instance.client;

String defualt_question_image =
    "https://assets.nautil.us/3006_5f268dfb0fbef44de0f668a022707b86.jpg";

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final questionController = TextEditingController();
  final solutionController = TextEditingController();
  final levelController = TextEditingController();
  String questionText = '';
  String solutionText = '';
  String level = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                  questionText.isEmpty ? defualt_question_image : questionText),
              TextField(
                controller: questionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Link to question',
                ),
              ),
              TextField(
                controller: solutionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'solution',
                ),
              ),
              TextField(
                controller: levelController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'level',
                ),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      questionText = questionController.text;
                      solutionText = solutionController.text;
                      level = levelController.text;
                    });
                  },
                  child: Text("Sussy Baka")),
              TextButton(
                  onPressed: () async {
                    await supabase.from(level).insert(
                        {'link': questionText, 'solution': solutionText});
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
