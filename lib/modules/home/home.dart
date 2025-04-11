import 'package:flutter/material.dart';
import 'layouts/mobile_layout.dart';
import 'layouts/tablet_layout.dart';
import 'layouts/desktop_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: const SafeArea(child: ResponsiveLayout()),
      ),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const MobileLayout();
        } else if (constraints.maxWidth < 1200) {
          return const TabletLayout();
        } else {
          return const DesktopLayout();
        }
      },
    );
  }
}
