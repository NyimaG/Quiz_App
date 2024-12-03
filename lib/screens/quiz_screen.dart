import 'package:flutter/material.dart';
import '../models/question.dart';
import '../screens/quizoptions.dart';
import '../services/api_service.dart';
import '../screens/summarypage.dart';

class QuizScreen extends StatefulWidget {
  final String number;
  final String category;
  final String difficulty;
  final String type;

  QuizScreen({
    required this.number,
    required this.category,
    required this.difficulty,
    required this.type,
  });
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> _questions = [];
  List<Map<String, dynamic>> answers =
      []; //Store User's answers for quiz summary
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _loading = true;
  bool _answered = false;
  String _selectedAnswer = "";
  String _feedbackText = "";
  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    try {
      final questions = await ApiService.fetchQuestions(
        number: widget.number,
        category: widget.category,
        difficulty: widget.difficulty,
        type: widget.type,
      );
      setState(() {
        _questions = questions;
        _loading = false;
      });
    } catch (e) {
      print(e);
// Handle error appropriately
    }
  }

  void _submitAnswer(String selectedAnswer) {
    setState(() {
      _answered = true;
      _selectedAnswer = selectedAnswer;
      final correctAnswer = _questions[_currentQuestionIndex].correctAnswer;

      answers.add({
        //adding data used for quiz summary to list 'answers'
        "question": _questions[_currentQuestionIndex].question,
        "userAnswer": selectedAnswer,
        "correctAnswer": correctAnswer,
      });

      if (selectedAnswer == correctAnswer) {
        _score++;
        _feedbackText = "Correct! The answer is $correctAnswer.";
      } else {
        _feedbackText = "Incorrect. The correct answer is $correctAnswer.";
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _answered = false;
      _selectedAnswer = "";
      _feedbackText = "";
      _currentQuestionIndex++;
    });
  }

  Widget _buildOptionButton(String option) {
    return ElevatedButton(
      onPressed: _answered ? null : () => _submitAnswer(option),
      child: Text(option),
      //style: ElevatedButton.styleFrom(primary: Colors.blue),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (_currentQuestionIndex >= _questions.length) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Quiz Finished! Your Score: $_score/${_questions.length}'),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      number: widget.number,
                      category: widget.category,
                      difficulty: widget.difficulty,
                      type: widget.type,
                    ),
                  ),
                ),
                child: Text("Retake Quiz"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => quiz()),
                      ),
                  child: Text("Create New Quiz")),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the SummaryPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SummaryPage(answers: answers),
                    ),
                  );
                },
                child: Text("View Summary"),
              ),
            ],
          ),
        ),
      );
    }
    final question = _questions[_currentQuestionIndex];
    final progress = (_currentQuestionIndex + 1) /
        _questions.length; //for progress indicator
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        actions: [
          //score display
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                "Score: $_score/${_questions.length}",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: progress,
              backgroundColor: const Color.fromARGB(255, 241, 58, 58),
              color: Colors.green,
              minHeight: 10,
            ),
            Text(
              'Question ${_currentQuestionIndex + 1}/${_questions.length}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              question.question,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ...question.options.map((option) => _buildOptionButton(option)),
            SizedBox(height: 20),
            if (_answered)
              Text(
                _feedbackText,
                style: TextStyle(
                  fontSize: 16,
                  color: _selectedAnswer == question.correctAnswer
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            if (_answered)
              ElevatedButton(
                onPressed: _nextQuestion,
                child: Text('Next Question'),
              ),
          ],
        ),
      ),
    );
  }
}
