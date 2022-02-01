import 'package:flutter/material.dart';
import 'package:lugargentefeliz/ui/Sections.dart';
import 'package:lugargentefeliz/ui/home/HomeScreen.dart';
import 'package:lugargentefeliz/ui/messages/MessagesScreen.dart';

void main() => runApp(const LgfApp());

class LgfApp extends StatelessWidget {
  const LgfApp({Key? key}) : super(key: key);

  static const String _title = 'Lugar de gente feliz';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidget();
}

class _MainWidget extends State<MainWidget> {

  int _selectedIndex = 0;

  static const List<Section> _sections = Section.values;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_sections.elementAt(_selectedIndex).title),
      ),
      body: Center(
        child: _sections.elementAt(_selectedIndex).widget,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Messages',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
