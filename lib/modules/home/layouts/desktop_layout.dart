import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/content.dart';
import '../widgets/footer.dart';

class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scrollbar(
            controller: _scrollController, // Associando o ScrollController
            thumbVisibility: true,
            thickness: 12,
            radius: const Radius.circular(6),
            child: SingleChildScrollView(
              controller: _scrollController, // Vinculando ao ScrollController
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 1200),
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
            ),
          ),
        ],
      ),
    );
  }
}
