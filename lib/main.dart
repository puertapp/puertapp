import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/calculator_screen.dart';
import 'screens/percentage_calculator_screen.dart';

void main() {
  runApp(MaterialApp(
    home: const AppEntry(),
    theme: ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.black,
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 0),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

class AppEntry extends StatefulWidget {
  const AppEntry({super.key});

  @override
  State<AppEntry> createState() => _AppEntryState();
}

class _AppEntryState extends State<AppEntry> {
  bool isAuthenticated = false;

  void onLoginSuccess() {
    setState(() {
      isAuthenticated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isAuthenticated
        ? const MainContainer()
        : LoginScreen(onSuccess: onLoginSuccess);
  }
}

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const CalculatorScreen(),
    const PercentageCalculatorScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculadora',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.percent),
            label: 'Cambio Puerta',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
