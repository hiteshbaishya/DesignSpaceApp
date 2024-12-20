import 'package:flutter/material.dart';

class DrawerHeaderPage extends StatelessWidget {
  const DrawerHeaderPage({super.key});  // Ensure the constructor is correctly defined

  @override
  Widget build(BuildContext context) {
    return const UserAccountsDrawerHeader(
      accountName: Text('John Doe123'),
      accountEmail: Text('john.doe@example.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(Icons.person, color: Colors.blue),
      ),
    );
  }
}
