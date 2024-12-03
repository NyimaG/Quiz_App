import 'package:flutter/material.dart';
//import 'package:quiz_app/services/api_service.dart';
//import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:quiz_app/screens/quiz_screen.dart';
//import '../models/question.dart';

class quiz extends StatefulWidget {
  const quiz({Key? key}) : super(key: key);

  @override
  _quizState createState() => _quizState();
}

class _quizState extends State<quiz> {
  String dropdownnumber = '5';
  String dropdowncat = '9';
  String dropdowntype = 'multiple';
  String dropdownlevel = 'easy';

  // List of items in our dropdown menu
  final List<String> number = [
    '5',
    '10',
    '15',
    '20',
  ];

  final Map<String, String> category = {
    'General Knowledge': '9',
    'Science': '17',
    'Math': '19',
    'History': '23',
  };
  /*var category = [
    'General Knowledge': '9',
    'Science': '17',
    'Math': '19',
    'History': '23',
  ];
  */

  final Map<String, String> type = {
    'Multiple Choice': 'multiple',
    'True/False': 'boolean',
  };

  /*var type = [
    'Multiple Choice',
    'True/False',
  ];*/

  final List<String> level = [
    'easy',
    'medium',
    'hard',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text("Create Your Quiz"),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                //DROPDOWN FOR # OF QUESTIONS
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Number of Questions",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          height: 10), // Spacing between title and dropdown
                      DropdownButton(
                        value: dropdownnumber,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: number.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownnumber = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                // DROPDOWN FOR CATEGORIES
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      DropdownButton(
                        value: dropdowncat,
                        items: category.entries.map((entry) {
                          return DropdownMenuItem<String>(
                            value: entry.value, // Store the ID as the value
                            child: Text(entry.key), // Display the category name
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropdowncat = value!;
                          });
                        },
                      ),
                      /*value: dropdowncat,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: category.keys.toList(),
                        //items: category.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdowncat = newValue!;
                          });
                        },*/
                    ],
                  ),
                ),

                // DROPDOWN FOR LEVEL
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Difficulty Level",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      DropdownButton(
                        value: dropdownlevel,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: level.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownlevel = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                // DROPDOWN FOR TYPE
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Quiz Type",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      DropdownButton(
                        value: dropdowntype,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: type.entries.map((entry) {
                          return DropdownMenuItem(
                            value: entry.value,
                            child: Text(entry.key),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdowntype = newValue!;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () => {
                            // Handle button press
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizScreen(
                                  number: dropdownnumber,
                                  category: dropdowncat,
                                  difficulty: dropdownlevel,
                                  type: dropdowntype,
                                ),
                              ),
                            )
                          },
                          child: Text("Submit"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
