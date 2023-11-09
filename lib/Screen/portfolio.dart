import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "About Me",
              style: TextStyle(color: Colors.orange, fontSize: 32),
            ),
            const SizedBox(
              height: 5,
            ),
            const CircleAvatar(
              // backgroundColor: Colors.white,
              radius: 60,
              backgroundImage: AssetImage("assets/images/avatar.jpg"),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
                width: 330,
                child: Text(
                  " Hey there, I'm Nikhil Thakre, a passionate B.Tech student at SGSITS, Indore, on a journey to explore the world of technology. My tech stack is primarily built around Flutter and Dart, and I'm proficient in using Firebase for backend development. I'm also well-versed in version control with Git.\n\nCurrently, I am expanding my knowledge by delving into the world of Java and data structures, always eager to take on new challenges and enhance my skills. Whether its creating cutting-edge mobile apps or tackling complex coding problems, I am here to embrace the ever-evolving tech landscape.\n\nJoin me on this exciting tech adventure, and let's build the future together!",
                  style: TextStyle(fontSize: 14),
                )),
            const SizedBox(
              height: 25,
            ),
            const Image(image: AssetImage("assets/images/stack.png")),
            const SizedBox(
              height: 25,
            ),
            const Text("Lets Connect!"),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    const instagram = "https://www.x.com/";
                    launchUrl(Uri.parse(instagram),
                        mode: LaunchMode.platformDefault);
                  },
                  icon: const FaIcon(FontAwesomeIcons.twitter),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {
                    //const instagram = "https://www.instagram.com/";
                    launchUrl(Uri(scheme: 'tel', path: "8305771858"),
                        mode: LaunchMode.platformDefault);
                  },
                  icon: const FaIcon(FontAwesomeIcons.phone),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {
                    const instagram = "https://github.com/thakrenikhil";
                    launchUrl(Uri.parse(instagram),
                        mode: LaunchMode.platformDefault);
                  },
                  icon: const FaIcon(FontAwesomeIcons.github),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {
                    const instagram =
                        "https://www.instagram.com/thakre_nikhill/";
                    launchUrl(Uri.parse(instagram),
                        mode: LaunchMode.platformDefault);
                  },
                  icon: const FaIcon(FontAwesomeIcons.instagram),
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
