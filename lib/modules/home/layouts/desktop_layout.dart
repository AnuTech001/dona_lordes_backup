import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/content.dart';
import '../widgets/footer.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 1200,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Column(
              children: const [
                Header(isLargeScreen: true),
                SizedBox(height: 40),
                Content(isLargeScreen: true),
                SizedBox(height: 40),
                Footer(isLargeScreen: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
