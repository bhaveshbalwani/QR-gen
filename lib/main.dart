import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_gen/QRScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    QRScreen(),
    const Text('Home Page', style: TextStyle(color: Colors.white)),
    const Text('Profile Page', style: TextStyle(color: Colors.white)),
  ];
  static const List<String> _appBarTitles = <String>[
    'QR',
    'Home',
    'Profile',
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        // Use _selectedIndex to pick the correct title
        title: Text(_appBarTitles[_selectedIndex], style: const TextStyle(fontSize: 22, color: Colors.white)),
        iconTheme: const IconThemeData(size:32,color: Colors.white), // change your color here
        centerTitle: true, // Add this line
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 50,bottom: 20),
                child: const Center(child: Text("My App", style: TextStyle(fontSize: 22, color: Colors.white))),
              ),
              ListTile(
                title: const Text('QR', style: TextStyle(color: Colors.white)),
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Home', style: TextStyle(color: Colors.white)),
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Profile', style: TextStyle(color: Colors.white)),
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code, color: _selectedIndex == 0 ? Colors.green : Colors.white),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: _selectedIndex == 1 ? Colors.green: Colors.white),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined, color: _selectedIndex == 2 ? Colors.green : Colors.white),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
