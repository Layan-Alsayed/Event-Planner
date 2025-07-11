import 'package:flutter/material.dart';

class GuestsProvider extends ChangeNotifier {
  // send noti for listenr
  final List<Map<String, String>> _guests = [];

  List<Map<String, String>> get guests => _guests;

  void addGuest(String name, String number) {
    _guests.add({'name': name, 'number': number});
    notifyListeners();
  }

  void editGuest(int index, String name, String number) {
    _guests[index] = {'name': name, 'number': number};
    notifyListeners();
  }

  void deleteGuest(int index) {
    _guests.removeAt(index);
    notifyListeners();
  }
}
