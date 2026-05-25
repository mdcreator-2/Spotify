import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(left: 8, bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 18, 18, 18),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          //Sidebar header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 12, 4),
            child: Row(
              children: [
                const Icon(
                  Icons.library_music_outlined,
                  color: Color(0xFFB3B3B3),
                  size: 22,
                ),
                const SizedBox(width: 10),
                Text(
                  'Your Library',
                  style: GoogleFonts.figtree(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                // + Create button
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1F1F1F),
                    shape: BoxShape.circle,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.add, color: Colors.white, size: 22),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                // Resize icon
                const Icon(
                  Icons.open_in_full_rounded,
                  color: Color(0xFFB3B3B3),
                  size: 16,
                ),
              ],
            ),
          ),

          //Filter Chips
        ],
      ),
    );
  }
}
