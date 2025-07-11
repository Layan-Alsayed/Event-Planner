import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_part/widget/event_provider.dart';
import 'package:my_part/models/event.dart';
import 'package:my_part/widget/event_list/event_list.dart';
import 'package:my_part/widget/new_event.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() {
    return _EventsState();
  }
}

class _EventsState extends State<Events> {
  void _openAddEventOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewEvent(onAddEvent: _addEvent),
    );
  }

  void _addEvent(Event event) {
    final eventProvider = Provider.of<EventProvider>(context, listen: false);
    eventProvider.addEvent(event);
  }

  void _removeEvent(Event event) {
    final eventProvider = Provider.of<EventProvider>(context, listen: false);
    eventProvider.removeEvent(event);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Event deleted'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            eventProvider.addEvent(event);
          }),
    ));
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
              'images/no-events.jpg',
              height: 190,
            ),
            const SizedBox(height: 20),
            const Text(
              'No events found, Start adding some',
              style: TextStyle(fontSize: 18, color: Colors.blue),
            )
          ],
        ),
      ),
    );

    if (eventProvider.events.isNotEmpty) {
      mainContent = EventsList(
        events: eventProvider.events,
        onRemoveEvent: _removeEvent,
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          )
        ],
        title: const Text(
          'CheckList',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [const Text('Current Events'), Expanded(child: mainContent)],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          onPressed: _openAddEventOverlay,
          child: const Icon(Icons.add),
          shape: const CircleBorder(),
          backgroundColor: Colors.blueAccent,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: Colors.white,
    );
  }
}
