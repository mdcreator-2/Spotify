import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'hover_builder.dart';

class RightSidebar extends StatelessWidget {
  const RightSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      margin: const EdgeInsets.only(right: 8, bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 16, 16),
            child: Row(
              children: [
                // Playlist icon
                const Icon(
                  Icons.queue_music_rounded,
                  color: Colors.white,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Liked Songs',
                    style: GoogleFonts.figtree(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // More options
                _buildHeaderAction(Icons.more_horiz, 20),
                const SizedBox(width: 8),
                // Expand
                _buildHeaderAction(Icons.open_in_full_rounded, 16),
              ],
            ),
          ),

          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Album art
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFDAA520), // Golden yellow
                              Color(0xFFB8860B), // Dark golden
                              Color(0xFF8B6914), // Deep gold
                            ],
                          ),
                        ),
                        child: Stack(
                          children: [
                            // Album art placeholder with vintage TV aesthetic
                            Center(
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2A2A2A),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: const Color(0xFF555555),
                                    width: 3,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.music_note_rounded,
                                      color: Colors.white.withValues(
                                        alpha: 0.6,
                                      ),
                                      size: 60,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Now Playing',
                                      style: GoogleFonts.figtree(
                                        color: Colors.white.withValues(
                                          alpha: 0.5,
                                        ),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Artist credits at the bottom
                            Positioned(
                              bottom: 12,
                              left: 14,
                              child: Text(
                                'CHAAR DIWAARI',
                                style: GoogleFonts.figtree(
                                  color: Colors.white.withValues(alpha: 0.9),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 12,
                              right: 14,
                              child: Text(
                                'RAFTAAR',
                                style: GoogleFonts.figtree(
                                  color: Colors.white.withValues(alpha: 0.9),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Song title and actions
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Farebi',
                              style: GoogleFonts.figtree(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            HoverBuilder(
                              builder: (isHovered) => Text(
                                'Chaar Diwaari, Raftaar',
                                style: GoogleFonts.figtree(
                                  color: isHovered ? Colors.white : const Color(0xFFB3B3B3),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  decoration: isHovered ? TextDecoration.underline : null,
                                  decorationColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Share button
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: HoverBuilder(
                          builder: (isHovered) => Icon(
                            Icons.ios_share_rounded,
                            color: isHovered ? Colors.white : const Color(0xFFB3B3B3),
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Added to library checkmark (green)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: const BoxDecoration(
                            color: Color(0xFF1DB954),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.black,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // About the artist
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Artist image placeholder
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 180,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFF2D2D2D), Color(0xFF1A1A1A)],
                              ),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Icon(
                                    Icons.person_rounded,
                                    color: Colors.white.withValues(alpha: 0.15),
                                    size: 100,
                                  ),
                                ),
                                // "About the artist" label
                                Positioned(
                                  top: 16,
                                  left: 16,
                                  child: Text(
                                    'About the artist',
                                    style: GoogleFonts.figtree(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Artist details
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Artist name + Follow
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Chaar Diwaari',
                                    style: GoogleFonts.figtree(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  HoverBuilder(
                                    builder: (isHovered) => Transform.scale(
                                      scale: isHovered ? 1.05 : 1.0,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(
                                            color: isHovered ? Colors.white : const Color(0xFF727272),
                                            width: 1,
                                          ),
                                        ),
                                        child: Text(
                                          'Follow',
                                          style: GoogleFonts.figtree(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              // Listener count
                              Text(
                                '1,234,567 monthly listeners',
                                style: GoogleFonts.figtree(
                                  color: const Color(0xFFB3B3B3),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 12),
                              // Bio text
                              Text(
                                'Underground Hip-hop artist from India, pushing boundaries with raw lyricism and authentic storytelling.',
                                style: GoogleFonts.figtree(
                                  color: const Color(0xFFB3B3B3),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Credits
                  Text(
                    'Credits',
                    style: GoogleFonts.figtree(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildCreditItem(
                    'Chaar Diwaari',
                    'Main Artist',
                    Icons.person_outline_rounded,
                  ),
                  _buildCreditItem(
                    'Raftaar',
                    'Featured Artist',
                    Icons.person_outline_rounded,
                  ),
                  _buildCreditItem(
                    'Mojo Jeeta',
                    'Producer',
                    Icons.person_outline_rounded,
                  ),
                  const SizedBox(height: 8),
                  HoverBuilder(
                    builder: (isHovered) => Text(
                      'Show all',
                      style: GoogleFonts.figtree(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        decoration: isHovered ? TextDecoration.underline : null,
                        decorationColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderAction(IconData icon, double size) {
    return HoverBuilder(
      builder: (isHovered) => Icon(
        icon,
        color: isHovered ? Colors.white : const Color(0xFFB3B3B3),
        size: size,
      ),
    );
  }

  Widget _buildCreditItem(String name, String role, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFF282828),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFFB3B3B3), size: 20),
          ),
          const SizedBox(width: 12),
          // Name + Role
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.figtree(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  role,
                  style: GoogleFonts.figtree(
                    color: const Color(0xFFB3B3B3),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          // Follow button for artists
          if (role.contains('Artist'))
            HoverBuilder(
              builder: (isHovered) => Transform.scale(
                scale: isHovered ? 1.05 : 1.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isHovered ? Colors.white : const Color(0xFF727272),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    'Follow',
                    style: GoogleFonts.figtree(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
