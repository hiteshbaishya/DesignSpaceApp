import 'package:designspace/screens/pages/binding.dart';
import 'package:designspace/screens/pages/completed_job.dart';
import 'package:designspace/screens/pages/lamination.dart';
import 'package:designspace/screens/pages/packing_forwarding.dart';
import 'package:designspace/screens/pages/post_press.dart';
import 'package:designspace/screens/pages/printing_digital_black.dart';
import 'package:designspace/screens/pages/printing_digital_color.dart';
import 'package:designspace/screens/pages/home_page.dart';
import 'package:designspace/screens/pages/printing_digital_color2.dart';
import 'package:designspace/screens/pages/printing_offset_four_color.dart';
import 'package:designspace/screens/pages/printing_offset_one_color.dart';
import 'package:designspace/screens/pages/printing_screen.dart';
import 'package:designspace/screens/template/drawer/drawer_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Remove the string initialization and rely on FutureBuilder

  int _selectedIndex = 0;

  // List of pages to display based on the selected index
  List<Widget> _pages = [
    HomePage(),  // Page 1
    PrintingDigitalColor(),
    PrintingDigitalColor2(),
    PrintingDigitalBlack(),
    PrintingOffsetOneColor(),
    PrintingOffsetFourColor(),    
    PrintingScreen(),
    Lamination(),
    PostPress(),
    Binding(),    
    PackingForwarding(),
    CompletedJob(),
  ];

  // Method to update the selected page
  void _onDrawerItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // Drawer widget
      drawer: DrawerPage(onItemTapped: _onDrawerItemTapped),  // Reference to the separate Drawer page
      // Use FutureBuilder to handle the async call and display the data
      body: _pages[_selectedIndex],
    );
  }
}
