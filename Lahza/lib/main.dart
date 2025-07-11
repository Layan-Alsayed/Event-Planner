import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widget/event_provider.dart';
import 'widget/home_page.dart';
import 'widget/loading-screen.dart';
import 'widget/events.dart';
import 'pages/AttendancePage.dart';
import 'pages/singup.dart';
import 'pages/login.dart';
import 'settings/settings.dart';
import 'pages/providers/guests_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventProvider()),
        ChangeNotifierProvider(create: (_) => GuestsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Planner',
      initialRoute: '/login', // Start page of the app
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/home': (context) => const MyEventPlannerApp(),
      },
    );
  }
}

class MyEventPlannerApp extends StatefulWidget {
  const MyEventPlannerApp({super.key});

  @override
  State<MyEventPlannerApp> createState() => _MyEventPlannerAppState();
}

class _MyEventPlannerAppState extends State<MyEventPlannerApp> {
  int _selectedIndex = 0;
  bool _isLoading = true;

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Events(),
    AttendancePage(),
    Settings(),
  ];

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  void _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      _isLoading = false;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? LoadingScreen()
          : Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
      bottomNavigationBar: _isLoading
          ? null
          : BottomNavigationBar(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.event),
                  label: 'Events',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle),
                  label: 'Guests',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              onTap: _onItemTapped,
            ),
    );
  }
}
