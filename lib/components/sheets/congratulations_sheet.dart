import 'package:flutter/material.dart';

class CongratulationsSheet extends StatefulWidget {
  const CongratulationsSheet({super.key});
  @override
  State<CongratulationsSheet> createState() => _CongratulationsSheetState();
}

class _CongratulationsSheetState extends State<CongratulationsSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Slide duration
    );

    // Define the offset for the SlideTransition (starting from the top)
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1), // Start position (above the screen)
      end: Offset.zero, // End position (in place)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  // Dispose of the controller when it's not needed
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Toggle the panel by triggering the animation
  void _togglePanel() {
    if (_controller.isDismissed) {
      _controller.forward(); // Slide in
    } else {
      _controller.reverse(); // Slide out
    }
  }

  @override
  Widget build(BuildContext context) {
    _togglePanel();
    return Stack(
      children: [
        // SlideTransition to handle the sliding animation
        SlideTransition(
          position: _offsetAnimation,
          child: Container(
            margin: const EdgeInsets.only(left: 16.0, right: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            height: 300,
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Congratulations!",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Your account was successfully connected with 'name'",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 10),
                  IconButton.filled(
                      color: Colors.white,
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.black),
                          fixedSize: WidgetStatePropertyAll(Size(75, 25))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                      ))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
