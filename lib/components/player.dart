import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'hover_builder.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  double _volume = 0.7;
  double _progress = 0.0;
  bool _isHoveringProgress = false;
  bool _isHoveringVolume = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Track info
          Expanded(
            flex: 3,
            child: Row(
              children: [
                // Album Art Thumbnail
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFF282828),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(
                    Icons.music_note,
                    color: Color(0xFF7F7F7F),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),

                // Track Title & Artist
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HoverBuilder(
                        builder: (isHovered) => Text(
                          'Farebi',
                          style: GoogleFonts.figtree(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            decoration: isHovered
                                ? TextDecoration.underline
                                : null,
                            decorationColor: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 2),
                      HoverBuilder(
                        builder: (isHovered) => Text(
                          'Chaar Diwaari, Raftaar',
                          style: GoogleFonts.figtree(
                            color: isHovered
                                ? Colors.white
                                : const Color(0xFFB3B3B3),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            decoration: isHovered
                                ? TextDecoration.underline
                                : null,
                            decorationColor: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),

                // Add to Library (Heart/Plus) Icon
                HoverBuilder(
                  builder: (isHovered) => Transform.scale(
                    scale: isHovered ? 1.1 : 1.0,
                    child: Icon(
                      Icons.add_circle_outline,
                      color: isHovered ? Colors.white : const Color(0xFFB3B3B3),
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Transport controls and progress
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Transport Controls Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildControlButton(
                      Icons.shuffle,
                      size: 18,
                      color: const Color(0xFFB3B3B3),
                    ),
                    const SizedBox(width: 16),
                    _buildControlButton(
                      Icons.skip_previous_rounded,
                      size: 24,
                      color: const Color(0xFFB3B3B3),
                    ),
                    const SizedBox(width: 10),

                    // Play/Pause button
                    HoverBuilder(
                      builder: (isHovered) => Transform.scale(
                        scale: isHovered ? 1.05 : 1.0,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    _buildControlButton(
                      Icons.skip_next_rounded,
                      size: 24,
                      color: const Color(0xFFB3B3B3),
                    ),
                    const SizedBox(width: 16),
                    _buildControlButton(
                      Icons.repeat_rounded,
                      size: 18,
                      color: const Color(0xFFB3B3B3),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // Progress Bar with Timestamps
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 40,
                      child: Text(
                        '-:--',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.figtree(
                          color: const Color(0xFFB3B3B3),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: MouseRegion(
                        onEnter: (_) =>
                            setState(() => _isHoveringProgress = true),
                        onExit: (_) =>
                            setState(() => _isHoveringProgress = false),
                        child: SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 4,
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: _isHoveringProgress ? 6 : 0,
                            ),
                            activeTrackColor: _isHoveringProgress
                                ? const Color(0xFF1DB954)
                                : Colors.white,
                            inactiveTrackColor: const Color(0xFF5E5E5E),
                            thumbColor: Colors.white,
                            overlayShape: SliderComponentShape.noOverlay,
                          ),
                          child: Slider(
                            value: _progress,
                            onChanged: (value) {
                              setState(() {
                                _progress = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 40,
                      child: Text(
                        '-:--',
                        style: GoogleFonts.figtree(
                          color: const Color(0xFFB3B3B3),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Utility controls
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Lyrics
                _buildControlButton(
                  Icons.mic_none_rounded,
                  size: 18,
                  color: const Color(0xFFB3B3B3),
                ),
                const SizedBox(width: 12),

                // Queue
                _buildControlButton(
                  Icons.queue_music_rounded,
                  size: 18,
                  color: const Color(0xFFB3B3B3),
                ),
                const SizedBox(width: 12),

                // Connect to Device
                _buildControlButton(
                  Icons.devices_rounded,
                  size: 18,
                  color: const Color(0xFFB3B3B3),
                ),
                const SizedBox(width: 12),

                // Volume Control
                MouseRegion(
                  onEnter: (_) => setState(() => _isHoveringVolume = true),
                  onExit: (_) => setState(() => _isHoveringVolume = false),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _volume == 0
                            ? Icons.volume_off_rounded
                            : _volume < 0.3
                            ? Icons.volume_mute_rounded
                            : _volume < 0.7
                            ? Icons.volume_down_rounded
                            : Icons.volume_up_rounded,
                        size: 18,
                        color: const Color(0xFFB3B3B3),
                      ),
                      const SizedBox(width: 6),
                      SizedBox(
                        width: 93,
                        child: SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 4,
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: _isHoveringVolume ? 6 : 0,
                            ),
                            activeTrackColor: _isHoveringVolume
                                ? const Color(0xFF1DB954)
                                : Colors.white,
                            inactiveTrackColor: const Color(0xFF5E5E5E),
                            thumbColor: Colors.white,
                            overlayShape: SliderComponentShape.noOverlay,
                          ),
                          child: Slider(
                            value: _volume,
                            onChanged: (value) {
                              setState(() {
                                _volume = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),

                // Mini Player / Picture-in-Picture
                _buildControlButton(
                  Icons.open_in_new_rounded,
                  size: 18,
                  color: const Color(0xFFB3B3B3),
                ),
                const SizedBox(width: 12),

                // Fullscreen
                _buildControlButton(
                  Icons.fullscreen_rounded,
                  size: 20,
                  color: const Color(0xFFB3B3B3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton(
    IconData icon, {
    double size = 20,
    Color color = Colors.white,
  }) {
    return HoverBuilder(
      builder: (isHovered) => Transform.scale(
        scale: isHovered ? 1.1 : 1.0,
        child: Icon(icon, size: size, color: isHovered ? Colors.white : color),
      ),
    );
  }
}
