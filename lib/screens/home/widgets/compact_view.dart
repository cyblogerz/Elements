import 'package:flutter/material.dart';

class CompactViewToggle extends StatefulWidget {
  @override
  _CompactViewToggleState createState() => _CompactViewToggleState();
}

class _CompactViewToggleState extends State<CompactViewToggle> {
  bool isCompact = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Compact View", style: TextStyle(fontSize: 16)),
          Switch(
            value: isCompact,
            onChanged: (value) {
              setState(() {
                isCompact = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
