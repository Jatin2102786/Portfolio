import 'package:flutter/material.dart';
import 'package:portfolio/Widgets/GradientButton.dart';
import 'package:portfolio/main.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: 1000, // Adjust width as needed
                height: 600, // Adjust height as needed
                child: Card(
                  elevation: 10, // Add elevation for shadow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [MyApp.primaryColor, MyApp.primaryColor],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: const Center(
                                    child: CircleAvatar(
                                      radius: 120,
                                      backgroundImage:
                                      AssetImage("assets/images/android.png"),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/mobile.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            color: Colors.black, // Color for right column
                            height: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'About',
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Flexible(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: const [
                                        Text(
                                          "Passionate Android and Flutter developer with a knack for creating seamless and user-friendly mobile applications. Skilled in Kotlin, Dart, and Flutter framework, I thrive on solving complex problems and delivering high-quality code. Dedicated to continuous learning and staying updated with the latest industry trends to bring innovative solutions to life.",
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "Mobile Development: Proficient in Kotlin, Dart, and Flutter, creating seamless and user-friendly applications.",
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "Innovative Solutions: Driven to solve complex problems with high-quality, maintainable code.",
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "Continuous Learner: Committed to staying updated with the latest industry trends and technologies.",
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "User-Centric Approach: Focused on delivering exceptional user experiences through intuitive design and functionality.",
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "Proven Track Record: Successfully developed and deployed multiple applications with high user satisfaction and strong performance metrics.",
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "Collaborative Team Player: Excellent communication and teamwork skills, contributing effectively to cross-functional teams.",
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                GradientButton(
                                  text: 'Download Resume',
                                  onPressed: () {





                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

