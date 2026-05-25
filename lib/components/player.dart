import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  double _volume = 0.7;
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.black,
      child: Column(
        children: [
          // Player controls row
          Expanded(
            child: Row(
              children: [
                // Left: Currently playing info (placeholder)
                const SizedBox(width: 16),
                // No current track info placeholder
                const Spacer(),

                // Center: Playback controls
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildControlButton(
                      Icons.shuffle,
                      size: 18,
                      color: const Color(0xFFB3B3B3),
                    ),
                    const SizedBox(width: 20),
                    _buildControlButton(
                      Icons.skip_previous,
                      size: 22,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 14),
                    // Play/Pause button (circle)
                    Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.pause,
                        color: Colors.black,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 14),
                    _buildControlButton(
                      Icons.skip_next,
                      size: 22,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 20),
                    _buildControlButton(
                      Icons.repeat,
                      size: 18,
                      color: const Color(0xFFB3B3B3),
                    ),
                  ],
                ),

                const Spacer(),

                // Right: Extra controls
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildControlButton(
                      Icons.queue_music,
                      size: 20,
                      color: const Color(0xFFB3B3B3),
                    ),
                    const SizedBox(width: 16),
                    _buildControlButton(
                      Icons.subtitles_outlined,
                      size: 20,
                      color: const Color(0xFFB3B3B3),
                    ),
                    const SizedBox(width: 16),
                    _buildControlButton(
                      Icons.volume_up,
                      size: 20,
                      color: const Color(0xFFB3B3B3),
                    ),
                    const SizedBox(width: 8),
                    // Volume slider
                    SizedBox(
                      width: 90,
                      child: SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 3,
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 5,
                          ),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: const Color(0xFF4D4D4D),
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
                const SizedBox(width: 16),
              ],
            ),
          ),

          // Progress bar at the very bottom
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 200),
            child: Row(
              children: [
                Text(
                  '-:--',
                  style: GoogleFonts.figtree(
                    color: const Color(0xFFB3B3B3),
                    fontSize: 11,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 3,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 0,
                      ),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF4D4D4D),
                      thumbColor: Colors.transparent,
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
                const SizedBox(width: 8),
                Text(
                  '-:--',
                  style: GoogleFonts.figtree(
                    color: const Color(0xFFB3B3B3),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }

  Widget _buildControlButton(
    IconData icon, {
    double size = 20,
    Color color = Colors.white,
  }) {
    return Icon(icon, size: size, color: color);
  }
}
