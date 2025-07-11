import 'package:my_part/widget/event_list/event_item.dart';
import 'package:flutter/material.dart';
import '../../models/event.dart';

class EventsList extends StatelessWidget {
  const EventsList(
      {super.key, required this.events, required this.onRemoveEvent});

  final List<Event> events;
  final void Function(Event event) onRemoveEvent;

  @override
  Widget build(context) {
    return ListView.builder(
        itemCount: events.length,
        itemBuilder: (ctx, index) => Dismissible(
              key: ValueKey(
                events[index],
              ),
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.75),
                margin: const EdgeInsets.symmetric(horizontal: 16),
              ),
              onDismissed: (direction) {
                onRemoveEvent(events[index]);
              },
              child: EventItem(events[index]),
            ));
  }
}
