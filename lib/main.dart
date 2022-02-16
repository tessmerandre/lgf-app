import 'package:flutter/material.dart';
import 'package:lugargentefeliz/ui/sections.dart';

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
        items: _sections.map((e) => mapFromSection(e)).toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem mapFromSection(Section section) {
    return BottomNavigationBarItem(
      icon: Icon(section.icon, color: Colors.blue),
      label: section.title,
    );
  }

}
