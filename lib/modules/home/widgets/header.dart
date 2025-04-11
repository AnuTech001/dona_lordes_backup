import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final bool isLargeScreen;

  const Header({super.key, this.isLargeScreen = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.orange[100]!.withOpacity(0.7),
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        "Armazém da Sítio\nSabor e Qualidade do Noroeste do Paraná",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "DancingScript",
          fontSize: isLargeScreen ? 32 : 24,
          color: Colors.green[900],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
