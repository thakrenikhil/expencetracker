import 'package:expencetracker/Screen/portfolio.dart';
import 'package:expencetracker/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expencetracker/Functions/authfunction.dart';
import 'package:expencetracker/Screen/loginScreen.dart';


class MainDrawer extends ConsumerWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final name = ref.watch(nameProvider);
    final email = ref.watch(emailProvider);

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.user,
                        size: 48,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: Text(
                          '$name\n$email',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.chartGantt,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Statics',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),onTap: (){},
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.clockRotateLeft,
              size: 22,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'History',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),onTap: (){print(name);},
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.language,
              size: 22,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Language',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),onTap: (){},
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Settings',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),onTap: (){},
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.code,
              size: 22,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'About',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Portfolio(),));},
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              size: 26,
              color: Colors.redAccent,
            ),
            title: Text(
              'Logout',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),onTap: ()async{
            await FirebaseAuth.instance.signOut();
          },
          )
        ],
      ),
    );
  }
}
