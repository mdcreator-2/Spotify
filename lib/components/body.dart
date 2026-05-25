import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'hover_builder.dart';
import 'hover_scrollable_row.dart';

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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              // Scrollable gradient background
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 350,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(
                          255,
                          33,
                          24,
                          62,
                        ), // Deep subtle purple gradient
                        Color(0xFF121212), // Fades out to standard background
                      ],
                    ),
                  ),
                ),
              ),
              // Content Column
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Filter chips row (All, Music, Podcasts)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                              child: HoverBuilder(
                                builder: (isHovered) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.white
                                        : (isHovered ? const Color(0xFF333333) : const Color(0xFF2A2A2A)),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    _filters[index],
                                    style: GoogleFonts.figtree(
                                      color: isSelected
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

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
                    const SizedBox(height: 12),

                    // ── Your favourite artists ──
                    _buildSectionHeader('Your favourite artists'),
                    _buildHorizontalArtistRow(
                      items: [
                        _ArtistData(
                          'Yo Yo Honey Singh',
                          const Color(0xFF8E8E8E),
                        ),
                        _ArtistData('Emiway Bantai', const Color(0xFF5C5C5C)),
                        _ArtistData('Anuv Jain', const Color(0xFF7A7A7A)),
                        _ArtistData('Aditya Rikhari', const Color(0xFF6B4226)),
                        _ArtistData('LXNGVX', const Color(0xFF8E44AD)),
                        _ArtistData('Dj Samir', const Color(0xFF2C3E50)),
                      ],
                    ),

                    const SizedBox(height: 48),

                    // FOOTER
                    _buildFooter(),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
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
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          HoverBuilder(
            builder: (isHovered) => Text(
              'Show all',
              style: GoogleFonts.figtree(
                color: const Color(0xFFB3B3B3),
                fontSize: 14,
                fontWeight: FontWeight.w700,
                decoration: isHovered ? TextDecoration.underline : null,
                decorationColor: const Color(0xFFB3B3B3),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ALBUM CARDS ROW
  Widget _buildHorizontalCardRow({required List<_CardData> items}) {
    return HoverScrollableRow(
      height: 290,
      itemCount: items.length,
      itemBuilder: (context, index) => _buildAlbumCard(items[index]),
    );
  }

  Widget _buildAlbumCard(_CardData item) {
    return HoverBuilder(
      builder: (isHovered) => Container(
        width: 180,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isHovered ? const Color(0xFF282828) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Album art placeholder
            Container(
              width: 156,
              height: 156,
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: BorderRadius.circular(6),
                boxShadow: isHovered ? [BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 4))] : null,
              ),
              child: const Center(
                child: Icon(Icons.music_note, color: Colors.white38, size: 40),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              item.title,
              style: GoogleFonts.figtree(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              item.subtitle,
              style: GoogleFonts.figtree(
                color: const Color(0xFFB3B3B3),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // FAVOURITE ARTISTS ROW (Circular)
  Widget _buildHorizontalArtistRow({required List<_ArtistData> items}) {
    return HoverScrollableRow(
      height: 240,
      itemCount: items.length,
      itemBuilder: (context, index) => _buildArtistCard(items[index]),
    );
  }

  Widget _buildArtistCard(_ArtistData item) {
    return HoverBuilder(
      builder: (isHovered) => Container(
        width: 180,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isHovered ? const Color(0xFF282828) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Circular artist image
            Container(
              width: 156,
              height: 156,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: item.color,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.person_rounded,
                  color: Colors.white.withOpacity(0.3),
                  size: 64,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              item.name,
              style: GoogleFonts.figtree(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              'Artist',
              style: GoogleFonts.figtree(
                color: const Color(0xFFB3B3B3),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // RADIO CARDS ROW
  Widget _buildHorizontalRadioRow({required List<_RadioData> items}) {
    return HoverScrollableRow(
      height: 260,
      itemCount: items.length,
      itemBuilder: (context, index) => _buildRadioCard(items[index]),
    );
  }

  Widget _buildRadioCard(_RadioData item) {
    return HoverBuilder(
      builder: (isHovered) => Container(
        width: 180,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isHovered ? const Color(0xFF282828) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Radio card image
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                "assets/images/radio.jpg",
                width: 156,
                height: 156,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'With ${item.name} and more',
              style: GoogleFonts.figtree(
                color: const Color(0xFFB3B3B3),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // FOOTER
  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Divider
          Container(height: 1, color: const Color(0xFF282828)),
          const SizedBox(height: 40),

          // Footer columns
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company column
              Expanded(
                child: _buildFooterColumn('Company', [
                  'About',
                  'Jobs',
                  'For the Record',
                ]),
              ),
              // Communities column
              Expanded(
                child: _buildFooterColumn('Communities', [
                  'For Artists',
                  'Developers',
                  'Advertising',
                  'Investors',
                  'Vendors',
                ]),
              ),
              // Useful links column
              Expanded(
                child: _buildFooterColumn('Useful links', [
                  'Support',
                  'Free Mobile App',
                  'Redeem',
                ]),
              ),
              // Spotify Plans column
              Expanded(
                child: _buildFooterColumn('Spotify Plans', [
                  'Premium Individual',
                  'Premium Duo',
                  'Premium Family',
                  'Premium Student',
                  'Spotify Free',
                ]),
              ),
              // Social icons on the right
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildSocialIcon(Icons.language),
                  const SizedBox(width: 12),
                  _buildSocialIcon(Icons.alternate_email_rounded),
                  const SizedBox(width: 12),
                  _buildSocialIcon(Icons.camera_alt_outlined),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),

          // Divider
          Container(height: 1, color: const Color(0xFF282828)),
          const SizedBox(height: 24),

          // Bottom row: Legal links + Copyright
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Legal links
              Wrap(
                spacing: 24,
                runSpacing: 8,
                children:
                    [
                          'Legal',
                          'Safety & Privacy Center',
                          'Privacy Policy',
                          'Cookies',
                          'About Ads',
                          'Accessibility',
                        ]
                        .map(
                          (link) => HoverBuilder(
                            builder: (isHovered) => Text(
                              link,
                              style: GoogleFonts.figtree(
                                color: isHovered ? Colors.white : const Color(0xFFA7A7A7),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                decoration: isHovered ? TextDecoration.underline : null,
                                decorationColor: Colors.white,
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
              // Copyright
              Text(
                '© 2026 Spotify AB',
                style: GoogleFonts.figtree(
                  color: const Color(0xFFA7A7A7),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildFooterColumn(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.figtree(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: HoverBuilder(
              builder: (isHovered) => Text(
                link,
                style: GoogleFonts.figtree(
                  color: isHovered ? Colors.white : const Color(0xFFB3B3B3),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  decoration: isHovered ? TextDecoration.underline : null,
                  decorationColor: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return HoverBuilder(
      builder: (isHovered) => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isHovered ? const Color(0xFF404040) : const Color(0xFF292929),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}

// DATA MODELS
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

class _ArtistData {
  final String name;
  final Color color;
  const _ArtistData(this.name, this.color);
}
