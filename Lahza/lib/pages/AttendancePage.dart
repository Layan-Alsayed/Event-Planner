import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final List<Map<String, dynamic>> guests = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addGuest({String? originalName, String? originalNumber}) {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        if (originalName != null && originalNumber != null) {
          final guestIndex = guests.indexWhere((guest) =>
              guest['name'] == originalName &&
              guest['number'] == originalNumber);
          if (guestIndex != -1) {
            guests[guestIndex]['name'] = nameController.text;
            guests[guestIndex]['number'] = numberController.text;
          }
        } else {
          guests.add({
            'name': nameController.text,
            'number': numberController.text,
          });
        }
      });
      nameController.clear();
      numberController.clear();
      Navigator.of(context).pop();
    }
  }

  void _showAddGuestDialog({String? originalName, String? originalNumber}) {
    if (originalName != null && originalNumber != null) {
      nameController.text = originalName;
      numberController.text = originalNumber;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFFF7F9FC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            originalName != null ? 'Edit Guest' : 'Add Guest',
            style: TextStyle(color: Color(0xFF383636)),
          ),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Guest Name',
                    labelStyle: TextStyle(color: Color(0xFF383636)),
                    filled: true,
                    fillColor: Color(0xFFF7F9FC),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a guest name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: numberController,
                  decoration: InputDecoration(
                    labelText: 'Guest Number',
                    labelStyle: TextStyle(color: Color(0xFF383636)),
                    filled: true,
                    fillColor: Color(0xFFF7F9FC),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a guest number';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _addGuest(
                  originalName: originalName,
                  originalNumber: originalNumber,
                );
              },
              child: Text(
                originalName != null ? 'Update' : 'Add',
                style: TextStyle(color: Color(0xFF44A5FF)),
              ),
            ),
            TextButton(
              onPressed: () {
                nameController.clear();
                numberController.clear();
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
          ],
        );
      },
    );
  }

  void _deleteGuest(int index) {
    setState(() {
      guests.removeAt(index);
    });
  }

  String getInitials(String name) {
    return name.isNotEmpty ? name[0].toUpperCase() : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guests', style: TextStyle(color: Color(0xFF383636))),
        backgroundColor: Color(0xFFF7F9FC),
        iconTheme: IconThemeData(color: Color(0xFF383636)),
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF7F9FC),
      body: guests.isEmpty
          ? Center(
              child: Text(
                'No guests added yet',
                style: TextStyle(color: Color(0xFF383636), fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: guests.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF44A5FF),
                      child: Text(
                        getInitials(guests[index]['name']),
                        style:
                            TextStyle(color: Color(0xFFF7F9FC), fontSize: 24),
                      ),
                    ),
                    title: Text(
                      guests[index]['name'],
                      style: TextStyle(
                        color: Color(0xFF383636),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('Guest Number: ${guests[index]['number']}'),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'Edit') {
                          _showAddGuestDialog(
                            originalName: guests[index]['name'],
                            originalNumber: guests[index]['number'],
                          );
                        } else if (value == 'Delete') {
                          _deleteGuest(index);
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return ['Edit', 'Delete'].map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      },
                      icon: Icon(Icons.more_vert, color: Color(0xFF44A5FF)),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddGuestDialog(),
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF44A5FF),
        tooltip: 'Add Guest',
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
