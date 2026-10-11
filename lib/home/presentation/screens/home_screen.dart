import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../widgets/section_header.dart';
import '../widgets/settings_controls_card.dart';
import '../widgets/storage_inspector_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(title: Text('My Bogura')),
          SliverSafeArea(
            top: false,
            sliver: SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
              sliver: SliverList.list(
                children:
                    const <Widget>[
                          SectionHeader(
                            icon: Icons.storage_rounded,
                            title: 'Persistence inspector',
                            subtitle: 'What is actually stored on this device',
                          ),
                          SizedBox(height: 12),
                          StorageInspectorCard(),
                          SizedBox(height: 28),
                          SectionHeader(
                            icon: Icons.tune_rounded,
                            title: 'Settings controller',
                            subtitle: 'Every change is saved the moment you make it',
                          ),
                          SizedBox(height: 12),
                          SettingsControlsCard(),
                        ]
                        .animate(interval: 120.ms)
                        .fadeIn(duration: 450.ms, curve: Curves.easeOut)
                        .slideY(begin: 0.06, end: 0, curve: Curves.easeOutCubic),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
