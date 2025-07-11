import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_part/widget/event_provider.dart';
import 'package:my_part/widget/events.dart';
import 'package:my_part/widget/event_list/event_item.dart';
import 'package:intl/intl.dart';
import 'package:my_part/pages/login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _calculateDaysLeft(DateTime eventDate) {
    final today = DateTime.now();
    final difference = eventDate.difference(today).inDays;

    if (difference < 0) {
      return 'Event has passed';
    } else if (difference == 0) {
      return 'Event is today';
    } else {
      return '$difference';
    }
  }

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);

    Widget mainContent = Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 140),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/no-upcoming.jpg',
              height: 200,
            ),
            const SizedBox(height: 10),
            const Text(
              'No upcoming event',
              style: TextStyle(fontSize: 18, color: Colors.blue),
            )
          ],
        ),
      ),
    );

    if (eventProvider.events.isNotEmpty) {
      final firstEvent = eventProvider.events.first;

      mainContent = Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              SizedBox(
                width: 300,
                height: 170,
                child: EventItem(firstEvent),
              ),
              const SizedBox(height: 10),
              const Text(
                'Days Remaining',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                _calculateDaysLeft(firstEvent.date),
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'days',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Guests Attending',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '4',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Guests',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(), // Navigate to LoginPage
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Upcoming Events',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(child: mainContent),
          ],
        ),
      ),
    );
  }
}
