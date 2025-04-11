import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/content.dart';
import '../widgets/footer.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
        child: Column(
          children: const [
            Header(isLargeScreen: true),
            SizedBox(height: 32),
            Content(isLargeScreen: true),
            SizedBox(height: 32),
            Footer(isLargeScreen: true),
          ],
        ),
      ),
    );
  }
}
