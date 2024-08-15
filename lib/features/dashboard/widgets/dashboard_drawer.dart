import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mess_mgmt/Global/store/app_state_store.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                const Text(
                  'Your Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Observer(builder: (context) {
                  final user = appState.currentUser;
                  if (user != null) {
                    return Text(user.fName);
                  }
                  return const SizedBox();
                }),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              // Handle navigation or action
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              // Handle navigation or action
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_page),
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.pop(context);
              // Handle navigation or action
            }, // Recursively add the carry to the next node
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              // Handle navigation or action
            },
          ),
        ],
      ),
    );
  }
}
