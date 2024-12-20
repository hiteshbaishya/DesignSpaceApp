import 'package:designspace/screens/template/drawer/drawer_header_page.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  // const DrawerPage({super.key, required this.onItemTapped});
  final Function(int) onItemTapped;
  
  const DrawerPage({Key? key, required this.onItemTapped}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // Remove any default padding
        children: <Widget>[
          // Drawer header
          const DrawerHeaderPage(),
          // Menu items in the drawer
          ListTile(
            title: const Text('Home'),
            onTap: () {
              onItemTapped(0);
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: const Text('Printing ( Digital Colour )'),
            onTap: () {
              onItemTapped(1);
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: const Text('Printing ( Digital Colour 2 )'),
            onTap: () {
              onItemTapped(2);
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: const Text('Printing ( Digital Black )'),
            onTap: () {
              onItemTapped(3);
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: const Text('Printing ( Offset 1 Color )'),
            onTap: () {
              onItemTapped(4);
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: const Text('Printing ( Offset 4 Color )'),
            onTap: () {
              onItemTapped(5);
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: const Text('Printing ( Screen Printing )'),
            onTap: () {
              onItemTapped(6);
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: const Text('Lamination'),
            onTap: () {
              onItemTapped(7);
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: const Text('Post-press'),
            onTap: () {
              onItemTapped(8);
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: const Text('Binding'),
            onTap: () {
              onItemTapped(9);
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: const Text('Packing & Forwarding'),
            onTap: () {
              onItemTapped(10);
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: const Text('Completed Job'),
            onTap: () {
              onItemTapped(11);
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}
