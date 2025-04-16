import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  final bool isLargeScreen;

  const Footer({super.key, this.isLargeScreen = false});

  Future<void> _launchUrl(String url) async {
    if (url.isEmpty) return; // Não faz nada se a URL estiver vazia
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Não foi possível acessar: $url');
    }
  }

  Widget _buildContactInfo(
    IconData icon,
    String text,
    Color color,
    String url,
  ) {
    return GestureDetector(
      onTap: () => _launchUrl(url),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(icon, color: color, size: 24),
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
      ),
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
            "Av. Rio Branco, 456, Centro, Loanda - PR\n\n"
            "Contate-nos por: ",
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
                    FontAwesomeIcons.whatsapp,
                    "(41) 9 8408-2151",
                    Colors.green,
                    "tel:+5541984082151",
                  ),
                  _buildContactInfo(
                    Icons.email,
                    "anubirdoteknologio@gmail.com",
                    Colors.red,
                    "mailto:anubirdoteknologio@gmail.com",
                  ),
                  _buildContactInfo(
                    FontAwesomeIcons.facebook,
                    "Dona Lordes Oficial",
                    Colors.blue[800]!, // Cor tradicional do Facebook
                    "", // URL vazia = não clicável
                  ),
                  _buildContactInfo(
                    FontAwesomeIcons.instagram,
                    "@dona_lordes_oficial",
                    Colors.pink, // Cor do Instagram
                    "", // URL vazia = não clicável
                  ),
                ],
              )
              : Column(
                children: [
                  _buildContactInfo(
                    FontAwesomeIcons.whatsapp,
                    "(41) 9 8408-2151",
                    Colors.green,
                    "tel:+5541984082151",
                  ),
                  const SizedBox(height: 8),
                  _buildContactInfo(
                    Icons.email,
                    "anubirdoteknologio@gmail.com",
                    Colors.red,
                    "mailto:anubirdoteknologio@gmail.com",
                  ),
                  const SizedBox(height: 8),
                  _buildContactInfo(
                    FontAwesomeIcons.facebook,
                    "Dona Lordes Oficial",
                    Colors.blue[800]!,
                    "",
                  ),
                  const SizedBox(height: 8),
                  _buildContactInfo(
                    FontAwesomeIcons.instagram,
                    "@dona_lordes_oficial",
                    Colors.pink,
                    "",
                  ),
                ],
              ),
        ],
      ),
    );
  }
}
