import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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

class Contactme extends StatelessWidget {
  const Contactme({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            const instagram = "https://www.x.com/";
            launchUrl(Uri.parse(instagram), mode: LaunchMode.platformDefault);
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
            launchUrl(Uri.parse(instagram), mode: LaunchMode.platformDefault);
          },
          icon: const FaIcon(FontAwesomeIcons.github),
          color: Colors.white,
        ),
        IconButton(
          onPressed: () {
            const instagram = "https://www.instagram.com/thakre_nikhill/";
            launchUrl(Uri.parse(instagram), mode: LaunchMode.platformDefault);
          },
          icon: const FaIcon(FontAwesomeIcons.instagram),
          color: Colors.white,
        ),
      ],
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text('Theme'),
              trailing: const Icon(Icons.color_lens),
              onTap: () {
                // Handle theme settings
                // You can navigate to a theme settings screen or show a dialog
                // for selecting themes.
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Account'),
              trailing: const Icon(Icons.account_circle),
              onTap: () {
                // Handle account settings
                // You can navigate to an account settings screen.
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Password'),
              trailing: const Icon(Icons.lock),
              onTap: () {
                // Handle password settings
                // You can navigate to a password change screen.
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('App Lock'),
              trailing: const Icon(Icons.fingerprint_outlined),
              onTap: () {
                // Handle password settings
                // You can navigate to a password change screen.
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Delete Account'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                // Handle password settings
                // You can navigate to a password change screen.
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Reset app Data'),
              trailing: const Icon(Icons.cleaning_services),
              onTap: () {
                // Handle password settings
                // You can navigate to a password change screen.
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Selected currency'),
              trailing: const Icon(Icons.currency_rupee_outlined),
              onTap: () {
                // Handle password settings
                // You can navigate to a password change screen.
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Monthly Budget'),
              trailing: const Icon(Icons.menu_book),
              onTap: () {
                // Handle password settings
                // You can navigate to a password change screen.
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  List<String> languages = [
    'English',
    'Hindi',
    'Spanish',
    'French',
    'German',
  ];
  String selectedLanguage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Language Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select your preferred language:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: languages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(languages[index]),
                  leading: Radio(
                    value: languages[index],
                    groupValue: selectedLanguage,
                    onChanged: (String? value) {
                      setState(() {
                        selectedLanguage = value!;
                        // Handle language selection
                        // You can save the selected language and update the app's locale.
                        // For simplicity, print the selected language for now.
                        print('Selected language: $selectedLanguage');
                      });
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Statistics')),backgroundColor: Colors.black,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Lottie.asset(
        "assets/images/d.json",
        reverse: true,
        repeat: true,
      )
    ]));
  }
}

class HistoryScreen extends StatelessWidget {
  final List<ExpenseRecord> expenseRecords = [
    ExpenseRecord(month: 'January', totalExpense: 7000),
    ExpenseRecord(month: 'February', totalExpense: 10000),
    ExpenseRecord(month: 'March', totalExpense: 11400),
    // Add more records as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Expense History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: expenseRecords.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text('Total Expense: \₹${expenseRecords[index].totalExpense}'),
                subtitle: Text('Month: ${expenseRecords[index].month}'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle tapping on a record, e.g., navigate to details screen
                  // You can replace this with your own logic
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ExpenseRecord {
  final String month;
  final double totalExpense;

  ExpenseRecord({required this.month, required this.totalExpense});
}

// class ExpenseCard extends StatelessWidget {
//   const ExpenseCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(color: Colors.black,
//       // elevation: 5,
//       margin: EdgeInsets.all(16),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child:  Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Title:',
//               style: TextStyle(
//                 fontWeight: FontWeight.normal,
//                 color: Colors.grey[600],
//                 fontSize: 12,
//               ),
//             ),Text(
//             'RAPIDO',
//             style: TextStyle(
//                 fontSize: 36,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white
//             ),
//           ),
//             SizedBox(height: 18,),
//             Text(
//               'Date:',
//               style: TextStyle(
//                 fontWeight: FontWeight.normal,
//                 color: Colors.grey[600],
//                 fontSize: 12,
//               ),
//             ),
//             Text(
//               'November 18, 2023',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//                 fontSize: 24,
//               ),
//             ),
//             SizedBox(height: 18),
//             Text(
//               'Category:',
//               style: TextStyle(
//                 fontWeight: FontWeight.normal,
//                 color: Colors.grey[600],
//                 fontSize: 12,
//               ),
//             ),
//             Row(
//               children: [
//
//                 Icon(
//                   Icons.work_history,
//                   color: Colors.white,
//                   size: 24,
//                 ),
//                 SizedBox(width: 16),
//                 Text(
//                   'WORK',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Amount:',
//               style: TextStyle(
//                 fontWeight: FontWeight.normal,
//                 color: Colors.grey[600],
//                 fontSize: 12,
//               ),
//             ),
//             Text(
//               '\$100.00',
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),SizedBox(height: 18,),
//             Text(
//               'Comments:',
//               style: TextStyle(
//                 fontWeight: FontWeight.normal,
//                 color: Colors.grey[600],
//                 fontSize: 12,
//               ),
//             ),
//             Text(
//               'College to home',
//               style: TextStyle(
//                 fontWeight: FontWeight.w400,
//                 color: Colors.white,
//                 fontSize: 18,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }