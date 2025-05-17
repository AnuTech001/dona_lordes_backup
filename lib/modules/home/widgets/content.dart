import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'action_button.dart';

class Content extends StatelessWidget {
  final bool isLargeScreen;

  const Content({super.key, this.isLargeScreen = false});

  // Função genérica para abrir URLs
  Future<void> _launchUrl(
    BuildContext context,
    String url,
    String successMessage,
    String errorMessage,
  ) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(successMessage),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      } else {
        throw errorMessage;
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  // Ações específicas para cada botão
  Future<void> _openCatalog(BuildContext context) async {
    await _launchUrl(
      context,
      'https://armazemdositio.com.br/catalogo',
      'Catálogo aberto com sucesso!',
      'Não foi possível abrir o catálogo',
    );
  }

  Future<void> _openFeedback(BuildContext context) async {
    await _launchUrl(
      context,
      'https://armazemdositio.com.br/opiniao',
      'Agradecemos sua opinião!',
      'Não foi possível abrir o formulário',
    );
  }

  Future<void> _openWhatsApp(BuildContext context) async {
    const phoneNumber = '+5541996146380';
    const message = 'Olá!'; // Mensagem opcional que pode ser pré-definida

    final url =
        'https://wa.me/$phoneNumber/?text=${Uri.encodeComponent(message)}';
    // ou alternativa: 'whatsapp://send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}';

    await _launchUrl(
      context,
      url,
      'Abrindo WhatsApp...',
      'Não foi possível abrir o WhatsApp',
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
          Text(
            "Você encontrará os mais deliciosos produtos artesanais da região Noroeste do Paraná. "
            "Aproveite também nossa seleção de frutas e verduras, com o menor preço e a melhor qualidade da cidade de Loanda!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isLargeScreen ? 20 : 16,
              color: Colors.brown[900],
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          const Divider(
            thickness: 2,
            color: Colors.orange,
            indent: 20,
            endIndent: 20,
          ),
          const SizedBox(height: 24),
          Text(
            "Quem somos?\n\n"
            "No coração do Noroeste do Paraná, nasceu uma ideia simples e apaixonada: oferecer alimentos artesanais de qualidade, feitos com carinho e respeito pela tradição. Foi em 1998 que Lourdes do Rosário de Jesus, conhecida por todos como Dona Lourdes, deu vida ao sonho de transformar o amor pela culinária em uma verdadeira missão. Assim, surgiu o Armazém do Sítio.",
            style: TextStyle(
              fontSize: isLargeScreen ? 18 : 16,
              color: Colors.brown[900],
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          const Divider(
            thickness: 2,
            color: Colors.orange,
            indent: 20,
            endIndent: 20,
          ),
          const SizedBox(height: 24),
          Text(
            "Explore mais através dos links abaixo:",
            style: TextStyle(
              fontSize: isLargeScreen ? 22 : 18,
              color: Colors.brown[900],
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          isLargeScreen
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ActionButton.buildActionButtons(
                  isLargeScreen: true,
                  onCatalogPressed: () => _openCatalog(context),
                  onFeedbackPressed: () => _openFeedback(context),
                  onPhonePressed: () => _openWhatsApp(context),
                ),
              )
              : Column(
                children: ActionButton.buildActionButtons(
                  isLargeScreen: false,
                  onCatalogPressed: () => _openCatalog(context),
                  onFeedbackPressed: () => _openFeedback(context),
                  onPhonePressed: () => _openWhatsApp(context),
                ),
              ),
        ],
      ),
    );
  }
}
