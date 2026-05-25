import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  int _selectedFilterIndex = 0;
  final List<String> _filters = ['All', 'Music', 'Podcasts'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filter chips row (All, Music, Podcasts)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: List.generate(_filters.length, (index) {
                final isSelected = _selectedFilterIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedFilterIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _filters[index],
                        style: GoogleFonts.figtree(
                          color: isSelected ? Colors.black : Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          // Scrollable content sections
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 16),
              children: [
                // ── Popular albums and singles ──
                _buildSectionHeader('Popular albums and singles'),
                _buildHorizontalCardRow(
                  items: [
                    _CardData(
                      'Aashiqui 2',
                      'Mithoon, Ankit Tiwari, Jeet Gannguli',
                      const Color(0xFF8B4513),
                    ),
                    _CardData(
                      'Raanjhan (From\n"Do Patti")',
                      'Sachet-Parampara,\nParampara Tandon, Kaus...',
                      const Color(0xFFCC7733),
                    ),
                    _CardData(
                      'Sanam Teri Kasam\n(Original Motion...',
                      'Himesh Reshammiya,\nSameer Anjaan, Subrat...',
                      const Color(0xFF2E7D32),
                    ),
                    _CardData(
                      'Finding Her',
                      'Kushagra, Bharath, Saaheal',
                      const Color(0xFFBB8844),
                    ),
                    _CardData(
                      'Ultimate Love Songs -\nArijit Singh',
                      'Arijit Singh',
                      const Color(0xFF4A3728),
                    ),
                    _CardData(
                      'Yeh Jawaa...\nDeewani...',
                      'Pritam',
                      const Color(0xFF6B4226),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // ── Popular radio ──
                _buildSectionHeader('Popular radio'),
                _buildHorizontalRadioRow(
                  items: [
                    _RadioData('Arijit Singh', const Color(0xFF1A5276)),
                    _RadioData('KK', const Color(0xFF2E7D32)),
                    _RadioData('Kishore Kumar', const Color(0xFF8E44AD)),
                    _RadioData('A.R. Rahman', const Color(0xFFC0392B)),
                    _RadioData('Shreya Ghoshal', const Color(0xFF2C3E50)),
                    _RadioData('Diljit D...', const Color(0xFFE67E22)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.figtree(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Show all',
            style: GoogleFonts.figtree(
              color: const Color(0xFFB3B3B3),
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalCardRow({required List<_CardData> items}) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return _buildAlbumCard(item);
        },
      ),
    );
  }

  Widget _buildAlbumCard(_CardData item) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Album art placeholder
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: item.color,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Center(
              child: Icon(Icons.music_note, color: Colors.white38, size: 40),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.title,
            style: GoogleFonts.figtree(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            item.subtitle,
            style: GoogleFonts.figtree(
              color: const Color(0xFFB3B3B3),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalRadioRow({required List<_RadioData> items}) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return _buildRadioCard(item);
        },
      ),
    );
  }

  Widget _buildRadioCard(_RadioData item) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Radio card with gradient background
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [item.color.withValues(alpha: 0.8), item.color],
              ),
            ),
            child: Stack(
              children: [
                // Spotify logo + RADIO badge top-right area
                Positioned(
                  top: 10,
                  left: 10,
                  child: Row(children: [_buildSmallSpotifyIcon()]),
                ),
                Positioned(
                  top: 8,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      'RADIO',
                      style: GoogleFonts.figtree(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                // Artist name bottom-left
                Positioned(
                  bottom: 14,
                  left: 14,
                  child: Text(
                    item.name,
                    style: GoogleFonts.figtree(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // Person icon as placeholder for artist image
                Positioned(
                  bottom: 30,
                  right: 10,
                  child: Icon(
                    Icons.person,
                    color: Colors.white.withValues(alpha: 0.2),
                    size: 60,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'With ${item.name} and more',
            style: GoogleFonts.figtree(
              color: const Color(0xFFB3B3B3),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildSmallSpotifyIcon() {
    return Container(
      width: 18,
      height: 18,
      decoration: const BoxDecoration(
        color: Color(0xFF1DB954),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.graphic_eq, color: Colors.white, size: 10),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// DATA MODELS
// ═══════════════════════════════════════════════════════════════════════════
class _CardData {
  final String title;
  final String subtitle;
  final Color color;
  const _CardData(this.title, this.subtitle, this.color);
}

class _RadioData {
  final String name;
  final Color color;
  const _RadioData(this.name, this.color);
}
