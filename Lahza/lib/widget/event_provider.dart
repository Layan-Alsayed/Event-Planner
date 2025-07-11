import 'package:flutter/material.dart';
import 'package:my_part/models/event.dart';

class EventProvider with ChangeNotifier {
  final List<Event> _registeredEvents = [];

  List<Event> get events => _registeredEvents;

  void addEvent(Event event) {
    _registeredEvents.add(event);
    notifyListeners();
  }

  void removeEvent(Event event) {
    _registeredEvents.remove(event);
    notifyListeners();
  }
}
