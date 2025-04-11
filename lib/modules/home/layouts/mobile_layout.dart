import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/content.dart';
import '../widgets/footer.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            Header(),
            SizedBox(height: 24),
            Content(),
            SizedBox(height: 24),
            Footer(),
          ],
        ),
      ),
    );
  }
}
