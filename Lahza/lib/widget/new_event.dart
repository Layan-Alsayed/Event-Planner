import 'package:my_part/models/event.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_part/models/questions-page.dart';
import 'package:my_part/models/event.dart' as event_models;

class NewEvent extends StatefulWidget {
  const NewEvent({super.key, required this.onAddEvent});

  final void Function(Event event) onAddEvent;

  @override
  State<NewEvent> createState() {
    return _NewEventState();
  }
}

class _NewEventState extends State<NewEvent> {
  final _titleController = TextEditingController();
  final _timeController = TextEditingController();
  final _minutesController = TextEditingController();

  DateTime? _selectedDate;
  event_models.Category _selectedCategory = event_models.Category.graduation;
  event_models.Time _selectedTime = event_models.Time.am;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              onSurface: Colors.blue,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _submitEventData() {
    final enteredTime = double.tryParse(_timeController.text);
    final enteredMinutes = int.tryParse(_minutesController.text);

    final timeIsInvalid =
        enteredTime == null || enteredTime <= 0 || enteredTime > 12;
    final minutesAreInvalid =
        enteredMinutes == null || enteredMinutes < 0 || enteredMinutes > 60;

    if (_titleController.text.trim().isEmpty ||
        timeIsInvalid ||
        minutesAreInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
              'Please make sure you have entered valid time and minutes, and filled out all fields.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay', style: TextStyle(color: Colors.blue)),
            )
          ],
        ),
      );
      return;
    }

    widget.onAddEvent(Event(
      title: _titleController.text,
      clock: enteredTime,
      minutes: enteredMinutes!,
      date: _selectedDate!,
      category: _selectedCategory,
      time: _selectedTime,
    ));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuestionsPage()),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _timeController.dispose();
    _minutesController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Title', style: TextStyle(color: Colors.blue)),
              ),
              style: const TextStyle(color: Colors.blue),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                // Time field
                Expanded(
                  child: TextField(
                    controller: _timeController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('Hour', style: TextStyle(color: Colors.blue)),
                    ),
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(width: 8),

                // Minutes field
                Expanded(
                  child: TextField(
                    controller: _minutesController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label:
                          Text('Minutes', style: TextStyle(color: Colors.blue)),
                    ),
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),

                const SizedBox(width: 8),

                // Time Dropdown
                DropdownButton<event_models.Time>(
                  value: _selectedTime,
                  items: event_models.Time.values.map((time) {
                    return DropdownMenuItem(
                      value: time,
                      child: Text(
                        time.name.toUpperCase(),
                        style: const TextStyle(color: Colors.blue),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedTime = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                const Text(
                  'Selected Date: ',
                  style: TextStyle(color: Colors.blue),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'No Selected Date'
                            : formatter.format(_selectedDate!),
                        style: const TextStyle(color: Colors.blue),
                      ),
                      IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.calendar_month,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Category Dropdown
            DropdownButton<event_models.Category>(
              value: _selectedCategory,
              items: event_models.Category.values.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(
                    category.name.toUpperCase(),
                    style: const TextStyle(color: Colors.blue),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
            const SizedBox(width: 90),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _submitEventData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Blue background for the button
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.white), // White text on the Next button
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
