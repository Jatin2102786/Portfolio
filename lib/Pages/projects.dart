import 'package:flutter/material.dart';
import 'package:portfolio/Widgets/string.dart';
import 'package:portfolio/main.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
   @override
  Widget build(BuildContext context) {

    Strings strings = Strings();
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    cardItem('Minor Projects ->',MyApp.secondaryColor, Colors.white),
                    cardItemProjects(Icons.sticky_note_2_outlined, 'Quotes',
                        strings.subtitleQuotes, MyApp.primaryColor, Colors.white),
                    cardItemProjects(Icons.text_fields_outlined, 'TextUtils',
                        strings.subtitleText, MyApp.secondaryColor, Colors.white),
                    cardItemProjects(Icons.cloud, 'Weather App', strings.Weather,
                        MyApp.primaryColor, Colors.white),
                    cardItemProjects(Icons.api, 'Unsplash Api', strings.Unsplash,
                        MyApp.secondaryColor, Colors.white),
                    cardItemProjects(Icons.reddit_sharp, 'Chatbot', strings.Chatbot,
                        MyApp.primaryColor, Colors.white),
                  ],
                ),
              ),
              cardItem3("assets/images/TSCM.png", "Thing Speak Cloud Monitoring", strings.thingSpeak,
                  Colors.white),
              cardItem3("assets/images/PSA.png", "Political Sentiment Analysis", strings.PSA,
                  Colors.white),
              cardItem3("assets/images/personalAssistant.png", "Personal Assistant", strings.persAssist,
                  Colors.white),
              cardItem3("assets/images/location.png", "Z++ Security", strings.zSecurity,
                  Colors.white),
        ]
          ),
        ),
      ),
    );
  }

  Widget cardItem(String text, Color bgColor, Color textColor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250.0,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 24, color: textColor),
          ),
        ),
      ),
    );
  }

  Widget cardItemProjects(IconData icon, String title, String subtitle,
      Color bgColor, Color textColor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200.0,
        width: 400.0,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(icon, color: textColor, size: 40.0),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Text(
                          subtitle,
                          style: TextStyle(fontSize: 14, color: textColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardItem3(
      String imagePath, String title, String subtitle, Color textColor) {
    return Padding(
      padding: const EdgeInsets.only(left:100.0,right:100.0,bottom: 16.0),
      child: Container(
        height: 300.0,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [MyApp.secondaryColor, MyApp.secondaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipOval(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  color: Colors.grey,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 30,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20,)
                    ,
                    Flexible(
                      child: SingleChildScrollView(
                        child: Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 15,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
