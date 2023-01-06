import 'package:flutter/material.dart';
import 'package:recepie_app/home.dart';
import 'package:recepie_app/search.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static const String _title = 'Lernzettel';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
          primarySwatch: Colors.orange
      ),
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int _selectedIndex = 1;


  static groups() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Home"),
          Icon(Icons.home),
        ],
      ),
    );
  }
  static account() {
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Messages"),
          Icon(Icons.message),
        ],
      ),
    );
  }

  final _pages = [
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Rezepte"),
          Icon(Icons.home),
        ],
      ),
    ),
    HomeWidget(),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Messages"),
          Icon(Icons.message),
        ],
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rezept App'),
        actions: [
          IconButton(
              padding: new EdgeInsets.all(0.0),
              icon: const Icon(
                  Icons.search,
                  size: 32.0),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchWidget())),
          ),
          IconButton(
              padding: new EdgeInsets.all(0.0),
              icon: const Icon(
                  Icons.add,
                  size: 32.0),
              onPressed: (){}
          ),
        ],
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Rezepte',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}