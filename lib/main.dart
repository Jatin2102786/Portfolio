import 'package:flutter/material.dart';
import 'package:portfolio/Pages/projects.dart';
import 'package:portfolio/Pages/about.dart';
import 'package:portfolio/Pages/contact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const Color primaryColor = Color(0xFF8697C4);
  static const Color secondaryColor = Color(0xFFADBBDA);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _content = const AboutPage();
  bool _isDrawerOpen = true;

  void _updateContent(Widget newContent) {
    setState(() {
      _content = newContent;
    });
  }

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                MyApp.primaryColor,
                MyApp.secondaryColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text("Jatin's Portfolio"),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _toggleDrawer,
          tooltip: 'Toggle Drawer',
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              _updateContent(const AboutPage());
              setState(() {
                _isDrawerOpen = true;
              });
            },
            tooltip: 'Home',
          ),
          const SizedBox(width: 20),
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              _updateContent(const ProjectsPage());
              setState(() {
                _isDrawerOpen = true;
              });
            },
            tooltip: 'Projects',
          ),
          const SizedBox(width: 20),
          IconButton(
            icon: const Icon(Icons.contact_page),
            onPressed: () {
              _updateContent(const ContactPage());
              setState(() {
                _isDrawerOpen = true;
              });
            },
            tooltip: 'Contact',
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: _isDrawerOpen ? 300 : 0, // Adjust width for the Drawer
                child: Drawer(
                  child: Container(
                    color: MyApp.primaryColor,
                    child: Center(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children:  <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Card(
                              shape: CircleBorder(),
                              elevation: 4.0,
                              child: CircleAvatar(
                                radius: 75,
                                backgroundImage:
                                    AssetImage('assets/images/img.png'),
                              ),
                            ),
                          ),
                          const Center(
                              child: Text(
                            "Jatin",
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          )),
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Card(color: MyApp.secondaryColor,
                                child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                              "Mobile Apps Developer",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                                    ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,4,10,4),
                            child: Container(color: Colors.white,height: 1,),
                          ),
                          const ListTile(
                            leading: Icon(Icons.email),
                            title: Text('Email' ,style: TextStyle(color: Colors.white),),
                            subtitle: Text('jatinmehmi583@gmail.com',style: TextStyle(color: Colors.white)),
                          ),
                          const ListTile(
                            leading: Icon(Icons.phone),
                            title: Text('Phone',style: TextStyle(color: Colors.white)),
                            subtitle: Text('+917658848135',style: TextStyle(color: Colors.white)),
                          ),
                          const ListTile(
                            leading: Icon(Icons.cake),
                            title: Text('Birthday',style: TextStyle(color: Colors.white)),
                            subtitle: Text('March 4, 2003',style: TextStyle(color: Colors.white)),
                          ),
                          const ListTile(
                            leading: Icon(Icons.location_on),
                            title: Text('Location',style: TextStyle(color: Colors.white)),
                            subtitle: Text('Alipur, Jalandhar, India',style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                  body: _content,
                ),
              ),
            ],
          ),
          if (_isDrawerOpen)
            GestureDetector(
              onTap: () {
                setState(() {
                  _isDrawerOpen = false;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width -
                    200, // Adjust width for the Drawer
              ),
            ),
        ],
      ),
    );
  }
}
