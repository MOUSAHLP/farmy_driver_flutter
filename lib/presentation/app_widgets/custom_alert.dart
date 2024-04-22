import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  const CustomAlert({super.key, required this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              // side: const BorderSide(color: Colors.white, width: 5)
            ),
            backgroundColor: Colors.white.withOpacity(0.8),
            content: SizedBox(
              child: SingleChildScrollView(
                child: content,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
