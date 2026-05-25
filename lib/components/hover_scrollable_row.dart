import 'package:flutter/material.dart';
import 'hover_builder.dart';

class HoverScrollableRow extends StatefulWidget {
  final double height;
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;

  const HoverScrollableRow({
    super.key,
    required this.height,
    required this.itemBuilder,
    required this.itemCount,
  });

  @override
  State<HoverScrollableRow> createState() => _HoverScrollableRowState();
}

class _HoverScrollableRowState extends State<HoverScrollableRow> {
  final ScrollController _scrollController = ScrollController();
  bool _canScrollLeft = false;
  bool _canScrollRight = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateScrollButtons);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateScrollButtons();
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateScrollButtons);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateScrollButtons() {
    if (!_scrollController.hasClients) return;
    setState(() {
      _canScrollLeft = _scrollController.position.pixels > 0;
      _canScrollRight = _scrollController.position.pixels < _scrollController.position.maxScrollExtent;
    });
  }

  void _scroll(double amount) {
    if (!_scrollController.hasClients) return;
    final targetPosition = (_scrollController.offset + amount)
        .clamp(0.0, _scrollController.position.maxScrollExtent);
    _scrollController.animateTo(
      targetPosition,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      builder: (isHovered) {
        return SizedBox(
          height: widget.height,
          child: Stack(
            children: [
              ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: widget.itemCount,
                itemBuilder: widget.itemBuilder,
              ),
              if (isHovered && _canScrollLeft)
                Positioned(
                  left: 16,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: _ScrollArrow(
                      icon: Icons.chevron_left,
                      onTap: () => _scroll(-300),
                    ),
                  ),
                ),
              if (isHovered && _canScrollRight)
                Positioned(
                  right: 16,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: _ScrollArrow(
                      icon: Icons.chevron_right,
                      onTap: () => _scroll(300),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _ScrollArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ScrollArrow({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(
      builder: (isArrowHovered) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isArrowHovered ? const Color(0xFF333333) : const Color(0xFF181818),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }
}
