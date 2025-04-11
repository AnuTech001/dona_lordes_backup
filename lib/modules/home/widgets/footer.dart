import 'package:flutter/material.dart';
// ignore: unused_import
import 'action_button.dart';

class Footer extends StatelessWidget {
  final bool isLargeScreen;

  const Footer({super.key, this.isLargeScreen = false});

  Widget _buildContactInfo(IconData icon, String text, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.local_florist, color: Colors.orange, size: 28),
              SizedBox(width: 12),
              Icon(Icons.verified, color: Colors.green, size: 28),
              SizedBox(width: 12),
              Icon(Icons.eco, color: Colors.brown, size: 28),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Armazém do Sítio - Qualidade Garantida\n"
            "Av. Rio Branco, 456, Centro, Loanda - PR",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isLargeScreen ? 18 : 16,
              color: Colors.green[900],
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          isLargeScreen
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildContactInfo(
                    Icons.phone,
                    "(44) 9 XXXX-XXXX",
                    Colors.green,
                  ),
                  _buildContactInfo(
                    Icons.email,
                    "armazemdositio@hotmail.com.br",
                    Colors.blue,
                  ),
                ],
              )
              : Column(
                children: [
                  _buildContactInfo(
                    Icons.phone,
                    "(44) 9 XXXX-XXXX",
                    Colors.green,
                  ),
                  const SizedBox(height: 12),
                  _buildContactInfo(
                    Icons.email,
                    "armazemdositio@hotmail.com.br",
                    Colors.blue,
                  ),
                ],
              ),
        ],
      ),
    );
  }
}
