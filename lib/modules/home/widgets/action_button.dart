import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final bool isLargeScreen;
  final VoidCallback? onPressed;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.isLargeScreen,
    this.onPressed,
  });

  static List<Widget> buildActionButtons({
    required bool isLargeScreen,
    required VoidCallback onCatalogPressed,
    required VoidCallback onFeedbackPressed,
    required VoidCallback onPhonePressed,
  }) {
    return [
      ActionButton(
        icon: Icons.menu_book_outlined,
        label: "Catálogo",
        color: Colors.brown[900]!,
        isLargeScreen: isLargeScreen,
        onPressed: onCatalogPressed,
      ),
      SizedBox(height: isLargeScreen ? 0 : 16),
      ActionButton(
        icon: Icons.question_answer_outlined,
        label: "Opinião",
        color: Colors.green[900]!,
        isLargeScreen: isLargeScreen,
        onPressed: onFeedbackPressed,
      ),
      SizedBox(height: isLargeScreen ? 0 : 16),
      ActionButton(
        icon: Icons.phone_outlined,
        label: "Fale conosco",
        color: Colors.blue[900]!,
        isLargeScreen: isLargeScreen,
        onPressed: onPhonePressed,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // ignore: deprecated_member_use
        backgroundColor: color.withOpacity(0.1),
        foregroundColor: color,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: color, width: 2),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: isLargeScreen ? 24 : 16,
          vertical: isLargeScreen ? 16 : 12,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: isLargeScreen ? 28 : 24),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: isLargeScreen ? 18 : 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
