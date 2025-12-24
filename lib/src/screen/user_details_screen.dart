import 'package:flutter/material.dart';
import '../model/user_model.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          info('Name', user.name),
          info('Username', user.username),
          info('Email', user.email),
          info('Phone', user.phone),
          info('Website', user.website),
          info('Address', user.address),
        ],
      ),
    );
  }

  Widget info(String title, String value) {
    return Card(
      child: ListTile(title: Text(title), subtitle: Text(value)),
    );
  }
}
