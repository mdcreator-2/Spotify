import 'package:flutter/material.dart';
import '../components/navbar.dart';

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
                Expanded(
                  child:
                      //Main Body
                      Column(
                        children: [
                          //Home Button
                        ],
                      ),
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
