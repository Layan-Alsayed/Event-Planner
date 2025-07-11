import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  final List<String> _questions = [
    'How many people will be attending?',
    'What is your preferred venue type?',
    'What kind of meal do you prefer?',
    'What entertainment type do you prefer?',
    'What decoration theme do you prefer?'
  ];

  final List<List<String>> _options = [
    ['Fewer than 50 guests', '50-100 guests', '100-200 guests', '200+ guests'],
    ['Outdoor', 'Indoor', 'Hybrid (Indoor/Outdoor)', 'Virtual'],
    ['Buffet', 'Plated Dinner', 'Food Trucks', 'Cocktail Party (Appetizers)'],
    ['DJ', 'Live Band', 'Playlist', 'None'],
    ['Minimalist', 'Classic', 'Modern', 'Themed (e.g., 80s, Floral)']
  ];

  final Map<int, String?> _answers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Answer Questions',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _questions[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                        ..._options[index].map((option) {
                          return RadioListTile<String>(
                            title: Text(option,
                                style: const TextStyle(color: Colors.blue)),
                            value: option,
                            groupValue: _answers[index],
                            activeColor: Colors.blue,
                            onChanged: (String? selected) {
                              setState(() {
                                _answers[index] = selected;
                              });
                            },
                          );
                        }).toList(),
                      ],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child:
                  const Text('Submit', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
