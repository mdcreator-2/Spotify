import 'package:flutter/material.dart';
import '../components/navbar.dart';
import '../components/sidebar.dart';
import '../components/body.dart';
import '../components/player.dart';
import '../components/right_sidebar.dart';

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
                //Left Sidebar
                SideBar(),
                //Main Content
                Expanded(
                  child: MainBody(),
                ),
                //Right Sidebar (Now Playing)
                RightSidebar(),
              ],
            ),
          ),

          //Bottom Player Bar
          Player(),
        ],
      ),
    );
  }
}
