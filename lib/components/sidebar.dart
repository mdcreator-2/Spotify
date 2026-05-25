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
            padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  'Artists',
                  style: GoogleFonts.figtree(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),

          //Search + Recent row
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: Row(
              children: [
                const Icon(Icons.search, color: Color(0xFFB3B3B3), size: 20),
                const Spacer(),
                Text(
                  'Recents',
                  style: GoogleFonts.figtree(
                    color: const Color(0xFFB3B3B3),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.format_list_bulleted,
                  color: Color(0xFFB3B3B3),
                  size: 18,
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                SideBarItem(
                  LikedSongIcon(),
                  'Liked Songs',
                  'Playlist • 14 songs',
                  showPin: true,
                ),
                SideBarItem(
                  ArtistAvatar(const Color(0xFF333333)),
                  'Ariana Grande',
                  'Artist',
                ),
                SideBarItem(
                  ArtistAvatar(const Color(0xFF444444)),
                  'Emiway Bantai',
                  'Artist',
                ),
                SideBarItem(
                  ArtistAvatar(const Color(0xFF555555)),
                  'Taylor Swift',
                  'Artist',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LikedSongIcon extends StatelessWidget {
  const LikedSongIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF4B17A6), Color(0xFF8E8EBC)],
        ),
      ),
      child: const Icon(Icons.favorite, color: Colors.white, size: 20),
    );
  }
}

class ArtistAvatar extends StatelessWidget {
  const ArtistAvatar(this.color, {super.key});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: const Icon(Icons.person, color: Color(0xFF777777), size: 22),
    );
  }
}

class SideBarItem extends StatelessWidget {
  const SideBarItem(
    this.icon,
    this.title,
    this.subtitle, {
    this.showPin = false,
    super.key,
  });
  final Widget icon;
  final String title;
  final String subtitle;
  final bool showPin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.figtree(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      if (showPin) ...[
                        const Icon(
                          Icons.push_pin,
                          color: Color(0xFF1DB954),
                          size: 12,
                        ),
                        const SizedBox(width: 4),
                      ],
                      Expanded(
                        child: Text(
                          subtitle,
                          style: GoogleFonts.figtree(
                            color: const Color(0xFFB3B3B3),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
