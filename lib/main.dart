import 'package:flutter/material.dart';
import 'package:portfolio/Pages/about.dart';
import 'package:portfolio/Pages/projects.dart';
import 'package:portfolio/Pages/contact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const Color primaryColor = Color(0xFf434343);
  static const Color secondaryColor = Color(0xFF000000);

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
  bool _isSidebarVisible = true;

  void _updateContent(Widget newContent) {
    setState(() {
      _content = newContent;
    });
  }

  void _toggleSidebar() {
    setState(() {
      _isSidebarVisible = !_isSidebarVisible;
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
                MyApp.primaryColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text("Jatin's Portfolio"),
        leading: IconButton(
          icon: Icon(_isSidebarVisible ? Icons.arrow_back : Icons.menu),
          onPressed: _toggleSidebar,
        ),
      ),
      body: Row(
        children: <Widget>[
          if (_isSidebarVisible)
            Container(
              width: 180,
              color: MyApp.secondaryColor,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.home, color: Colors.white),
                    title: const Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      _updateContent(const AboutPage());
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.list, color: Colors.white),
                    title: const Text(
                      'Projects',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      _updateContent(const ProjectsPage());
                    },
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.contact_page, color: Colors.white),
                    title: const Text(
                      'Contact',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      _updateContent(const ContactPage());
                    },
                  ),
                  // / Add more ListTiles for additional pages
                ],
              ),
            ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: _content,
            ),
          ),
        ],
      ),
    );
  }
}
