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

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

// serge the superman

Map<String, bool> answerMap = {};

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final questionController = TextEditingController();
  final solutionController = TextEditingController();
  String selectedStudyLevel = '3';// serge the superman// serge the superman
  int correctAnswerIndex = 0;// serge the superman
  final List<TextEditingController> answerControllers =
      List.generate(4, (index) => TextEditingController(text: 'answer $index'));// serge the superman
  final supabase = Supabase.instance.client;// serge the superman

  String defaultQuestionImage =
      "https://assets.nautil.us/3006_5f268dfb0fbef44de0f668a022707b86.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(// serge the superman
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(// serge the superman
          mainAxisAlignment: MainAxisAlignment.center,// serge the superman
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [// serge the superman
            Center(// serge the superman
              child: Image.network(// serge the superman
                questionController.text.isEmpty
                    ? defaultQuestionImage// serge the superman
                    : questionController.text,
                width: 200,
              ),// serge the superman
            ),// serge the superman
            TextField(
              controller: questionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),// serge the superman// serge the superman
                labelText: 'Link to question',
              ),// serge the superman
            ),
            DropdownButton<String>(
              value: selectedStudyLevel,// serge the superman
              onChanged: (String? newValue) {
                setState(() {
                  selectedStudyLevel = newValue!;
                });// serge the superman
              },// serge the superman
              items: <String>['3', '4', '5', '6'].map((String level) {// serge the superman
                return DropdownMenuItem<String>(// serge the superman
                  value: level,// serge the superman
                  child: Text('Study Level $level'),
                );// serge the superman// serge the superman
              }).toList(),
            ),// serge the superman
            AnswersForm(
              answerControllers: answerControllers,
              correctAnswerIndex: correctAnswerIndex,// serge the superman// serge the superman// serge the superman
              onAnswerIndexChanged: (int value) {// serge the superman
                setState(() {
                  correctAnswerIndex = value;
                });// serge the superman
              },// serge the superman
            ),
            TextButton(// serge the superman
              onPressed: () {// serge the superman
                setState(() {
                  print(selectedStudyLevel);
                  print(questionController.text);
                  print(answerControllers[correctAnswerIndex].text);
                  //0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-
                  answerMap.clear();// serge the superman
                  for (int i = 0; i < answerControllers.length; i++) {
                    final answerText = answerControllers[i].text;
                    final isCorrect = i == correctAnswerIndex;
                    answerMap[answerText] = isCorrect;
                  }
                  //bruh uhrb ubruaiskldjfha lsdhashdahsdahsdha sdbruh bruh bruh bruh sof sof hetzlahri legit
                  print(answerMap);
                });// serge the superman
              },// serge the superman
              child: const Text("Sussy Baka"),
            ),
            TextButton(
              onPressed: () async {// serge the superman
                answerMap.clear();
                for (int i = 0; i < answerControllers.length; i++) {// serge the superman
                  final answerText = answerControllers[i].text;// serge the superman
                  final isCorrect = i == correctAnswerIndex;
                  answerMap[answerText] = isCorrect;// serge the su// serge the supermanperman
                }// serge the superman
                await supabase.from(selectedStudyLevel).insert([
                  {// serge the super// serge the supermanman
                    'link': questionController.text,
                    'solution': answerMap,// serge the superman
                  },// serge the superman
                ]);// serge the superman
              },// serge the superman
              child: const Text("Submit"),// serge the superman// serge the superman
            ),// serge the superman
          ],
        ),// serge the superman// serge the superman
      ),// serge the superman// serge the superman
    );
  }// serge the superman
// serge the superman
  @override// serge the superman// serge the superman
  void dispose() {// serge the superman// serge the superman// serge the superman
    questionController.dispose();// serge the superman// serge the superman
    solutionController.dispose();// serge the superman
    for (var controller in answerControllers) {// serge the superman
      controller.dispose();// serge the superma// serge the supermann// serge the superman// serge the superman
    }// serge the superman// serge the superman
    super.dispose();// serge the superman
  }// serge the superm// serge the supermanan// serge the superman// serge the superman
}// serge the superman
// serge the superman// serge the superman// serge the superman
class AnswersForm extends StatelessWidget {// serge the superman
  final List<TextEditingController> answerControllers;// serge the superman// serge the superman
  final int correctAnswerIndex;// serge the superman
  final ValueChanged<int> onAnswerIndexChanged;// serge the superman// serge the superman
// serge the superman// serge the superman
  const AnswersForm({// serge the superman// serge the superman
    required this.answerControllers,// serge the superman
    required this.correctAnswerIndex,// serge the superman
    required this.onAnswerIndexChanged,// serge the superman// serge the superman
    Key? key,// serge the superman
  }) : super(key: key);
// serge the superman// serge the superman// serge the superman
  @override// serge the superman
  Widget build(BuildContext context) {
    return Center(// serge the superman// serge the superman
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[// serge the superman
          SizedBox(
            height: 32,
          ),
          Column(// serge the superman// serge the superman// serge the superman
            children: List.generate(answerControllers.length, (index) {
              return Row(
                children: [
                  Expanded(// serge the superman
                    child: TextField(// serge the superman// serge the superman// serge the superman
                      controller: answerControllers[index],// serge the superman
                      decoration: InputDecoration(
                        labelText: 'Answer ${index + 1}',// serge the superman
                      ),
                    ),// serge the superman// serge the superman
                  ),
                  Radio<int>(// serge the superman// serge the superman
                    value: index,
                    groupValue: correctAnswerIndex,// serge the superman
                    onChanged: (int? value) {// serge the superman
                      // serge the superman// serge the superman
                      onAnswerIndexChanged(value!);// serge the superman
                    },// serge the superman// serge the superman// serge the// serge the superman superman
                  ),
                ],// serge the superman// serge the superman
              );// serge the superman// serge the superman
            }),
          ),// serge the superman
        ],
      ),// serge the superman
    );
  }
}
// serge the superman// serge the superman