import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> preCreatedWidgets = [
      cardItem3('assets/Images/gitHub.png', 'Github', 'Jatin2102786', Colors.black, 'https://github.com/Jatin2102786'),
      cardItem3('assets/Images/LinkedIn.png', 'LinkedIn', 'Jatin Mehmi', Colors.black, 'https://www.linkedin.com/in/jatin-mehmi-84bbab253/'),
      cardItem3('assets/Images/insta.png', 'Instagram', 'jatin__mehmi', Colors.black, 'https://www.instagram.com/jatin__mehmi/'),
    ];

    return Scaffold(
      body: GridView.count(
        crossAxisCount: MediaQuery.of(context).size.width < 600 ? 1 : 2, // Adjust number of columns based on screen width
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 2.0, // Adjust the aspect ratio to decrease item height
        padding: const EdgeInsets.all(10.0),
        children: preCreatedWidgets,
      ),
    );
  }

  Widget cardItem3(String imagePath, String title, String subtitle, Color textColor, String url) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 3,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Flexible(
                    flex: 1,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20, // Adjust the font size as needed
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Flexible(
                    flex: 1,
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12, // Adjust the font size as needed
                        color: textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
