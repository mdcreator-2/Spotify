import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'hover_builder.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          // Logo
          const SizedBox(width: 16),
          HoverBuilder(
            builder: (isHovered) => Transform.scale(
              scale: isHovered ? 1.05 : 1.0,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
          ),
          const SizedBox(width: 25),

          const Spacer(),

          // Home button
          HoverBuilder(
            builder: (isHovered) => Transform.scale(
              scale: isHovered ? 1.05 : 1.0,
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xFF1F1F1F),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.home_filled, color: Colors.white, size: 30),
              ),
            ),
          ),
          const SizedBox(width: 8),

          // Search bar
          Expanded(
            flex: 3,
            child: HoverBuilder(
              builder: (isHovered) => Container(
                height: 50,
                constraints: const BoxConstraints(maxWidth: 480),
                decoration: BoxDecoration(
                  color: isHovered ? const Color(0xFF2A2A2A) : const Color(0xFF1F1F1F),
                  borderRadius: BorderRadius.circular(24),
                  border: isHovered ? Border.all(color: const Color(0xFF404040)) : Border.all(color: Colors.transparent),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Icon(
                        Icons.search,
                        color: isHovered ? Colors.white : const Color(0xFFB3B3B3),
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'What do you want to play?',
                        style: GoogleFonts.figtree(
                          color: const Color(0xFFB3B3B3),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      height: 24,
                      width: 1,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        Icons.library_music_outlined,
                        color: isHovered ? Colors.white : const Color(0xFFB3B3B3),
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 60),

          // Explore premium button
          HoverBuilder(
            builder: (isHovered) => Transform.scale(
              scale: isHovered ? 1.05 : 1.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFF727272), width: 1),
                ),
                child: Text(
                  'Explore Premium',
                  style: GoogleFonts.figtree(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),

          // Install app button
          NavLink(
            "Install App",
            fontSize: 14,
            icon: Icons.arrow_circle_down_outlined,
          ),
          const SizedBox(width: 32),

          // Notification button
          NavLink("", fontSize: 16, icon: Icons.notifications_none_rounded),
          const SizedBox(width: 8),

          // Friend activity button
          NavLink("", fontSize: 16, icon: Icons.group_outlined),
          const SizedBox(width: 8),

          // Profile icon
          HoverBuilder(
            builder: (isHovered) => Transform.scale(
              scale: isHovered ? 1.05 : 1.0,
              child: Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color(0xFF1F1F1F),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(217, 237, 164, 6),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'M',
                      style: GoogleFonts.figtree(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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

class NavLink extends StatelessWidget {
  const NavLink(this.label, {this.fontSize = 16, this.icon, super.key});
  final String label;
  final double fontSize;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      builder: (isHovered) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: fontSize + 4, color: isHovered ? Colors.white : const Color(0xFFB3B3B3)),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: GoogleFonts.figtree(
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
                color: isHovered ? Colors.white : const Color(0xFFB3B3B3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
