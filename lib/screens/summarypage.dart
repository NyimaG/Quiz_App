import 'package:flutter/material.dart';
import '../screens/quizoptions.dart';

class SummaryPage extends StatelessWidget {
  final List<Map<String, dynamic>> answers;

  const SummaryPage({Key? key, required this.answers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Summary'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: answers.length,
              itemBuilder: (context, index) {
                final answer = answers[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Q${index + 1}: ${answer['question']}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Your Answer: ${answer['userAnswer']}",
                          style: TextStyle(
                            fontSize: 14,
                            //color: answer['isCorrect'] ? Colors.green : Colors.red,
                          ),
                        ),
                        Text(
                          "Correct Answer: ${answer['correctAnswer']}",
                          style: TextStyle(fontSize: 14, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => quiz()),
                  ),
              child: Text("Create New Quiz")),
        ],
      ),
    );
  }
}
