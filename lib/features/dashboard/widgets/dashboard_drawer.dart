import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mess_mgmt/Global/Functions/screen_transition.dart';
import 'package:mess_mgmt/Global/models/user_model.dart';
import 'package:mess_mgmt/Global/store/app_state_store.dart';
import '../../auth/stores/auth_store.dart';

class DashboardDrawer extends StatelessWidget {
  DashboardDrawer({super.key});
  final User = appState.currentUser;
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
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const CouponListScreen(),
//                 ),
//               );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              authStore.logout();
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.token_sharp),
            title: const Text('My coupons'),
            onTap: () {
              navigateToNextScreen(
                  nextScreen: const MyCouponScreen(), context: context);
            },
          ),
        ],
      ),
    );
  }
}
