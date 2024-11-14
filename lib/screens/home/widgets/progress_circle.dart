import 'package:flutter/material.dart';

class ProgressCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value:
                    0.5, // Set this value dynamically based on habit completion
                strokeWidth: 8,
                backgroundColor: Colors.grey.shade300,
                color: Colors.purple,
              ),
              Icon(
                Icons.bolt,
                color: Colors.orange,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
