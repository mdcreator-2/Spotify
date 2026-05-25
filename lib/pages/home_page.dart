import 'package:flutter/material.dart';
import '../components/navbar.dart';
import '../components/sidebar.dart';
import '../components/body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //Navbar
          NavBar(),
          Expanded(
            child: Row(
              children: [
                //Sidebar
                SideBar(),
                Expanded(
                  child: MainBody(),
                ),
              ],
            ),
          ),

          //Bottom Player Bar
        ],
      ),
    );
  }
}
