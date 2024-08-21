import 'package:flutter/material.dart';
class WobbleAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Color color;

  const WobbleAppBar({required this.title, required this.color, super.key});

  @override
  State<WobbleAppBar> createState() => _WobbleAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _WobbleAppBarState extends State<WobbleAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween(begin: -0.03, end: 0.03).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation.value,
          child: AppBar(
            backgroundColor: widget.color,
            title: Text(widget.title,
            style:const TextStyle(
              color: Colors.blueAccent
            ),),
            
            centerTitle: true,
          ),
        );
      },
    );
  }
}
