import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final VoidCallback? onLogin;
  final VoidCallback? onLogout;
  final VoidCallback? onSubscribe;

  const AppDrawer({super.key, this.onLogin, this.onLogout, this.onSubscribe});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: const Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            onTap: () {
              if (onLogin != null) {
                onLogin!(); // Trigger the login callback
              }
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              if (onLogout != null) {
                onLogout!(); // Trigger the logout callback
              }
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.subscriptions),
            title: const Text('Subscribe'),
            onTap: () {
              if (onSubscribe != null) {
                onSubscribe!(); // Trigger the subscribe callback
              }
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
