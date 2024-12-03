import 'package:flutter/material.dart';

class quiz extends StatefulWidget {
  const quiz({Key? key}) : super(key: key);

  @override
  _quizState createState() => _quizState();
}

class _quizState extends State<quiz> {
  String dropdownnumber = '1';
  String dropdowncat = 'Item 1';
  String dropdowntype = 'Multiple Choice';
  String dropdownlevel = 'Easy';

  // List of items in our dropdown menu
  var number = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  var category = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var type = [
    'Multiple Choice',
    'True/False',
  ];

  var level = [
    'Easy',
    'Medium',
    'Hard',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text("Create Your Quiz"),
      ),
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.start,
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10), // Spacing between title and dropdown
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                DropdownButton(
                  value: dropdowncat,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: category.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdowncat = newValue!;
                    });
                  },
                ),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                DropdownButton(
                  value: dropdowntype,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: type.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdowntype = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
