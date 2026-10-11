import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../settings/settings.dart';
import 'surface_card.dart';

/// Controls bound to [AppSettingsNotifier]. Every change is optimistic and
/// persisted; a failed write rolls back and surfaces a snackbar.
class SettingsControlsCard extends ConsumerWidget {
  const SettingsControlsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(appSettingsProvider);
    final notifier = ref.read(appSettingsProvider.notifier);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    final divider = Divider(height: 1, indent: 16, endIndent: 16, color: scheme.outlineVariant.withValues(alpha: 0.5));

    return SurfaceCard(
      child: Column(
        children: [
          _ControlTile(
            icon: Icons.brightness_6_rounded,
            title: 'Appearance',
            child: SegmentedButton<ThemeMode>(
              showSelectedIcon: false,
              expandedInsets: EdgeInsets.zero,
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              segments: const [
                ButtonSegment(
                  value: ThemeMode.system,
                  icon: Icon(Icons.settings_suggest_rounded),
                  label: Text('System'),
                ),
                ButtonSegment(value: ThemeMode.light, icon: Icon(Icons.light_mode_rounded), label: Text('Light')),
                ButtonSegment(value: ThemeMode.dark, icon: Icon(Icons.dark_mode_rounded), label: Text('Dark')),
              ],
              selected: {settings.themeMode},
              onSelectionChanged: (selection) => _guard(context, () => notifier.setThemeMode(selection.first)),
            ),
          ),
          divider,
          _ControlTile(
            icon: Icons.translate_rounded,
            title: 'Language',
            child: SegmentedButton<String>(
              showSelectedIcon: false,
              expandedInsets: EdgeInsets.zero,
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              segments: const [
                ButtonSegment(value: 'en', label: Text('English')),
                ButtonSegment(value: 'bn', label: Text('বাংলা')),
              ],
              selected: {settings.languageCode},
              onSelectionChanged: (selection) => _guard(context, () => notifier.setLanguage(selection.first)),
            ),
          ),
          divider,
          SwitchListTile(
            secondary: const Icon(Icons.notifications_active_rounded),
            title: const Text('Notifications'),
            subtitle: const Text('Events, alerts and community updates'),
            value: settings.notificationsEnabled,
            onChanged: (enabled) => _guard(context, () => notifier.setNotificationsEnabled(enabled)),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.fingerprint_rounded),
            title: const Text('Biometric lock'),
            subtitle: const Text('Require authentication to open the app'),
            value: settings.biometricLockEnabled,
            onChanged: (enabled) => _guard(context, () => notifier.setBiometricLockEnabled(enabled)),
          ),
          ListTile(
            leading: const Icon(Icons.flag_rounded),
            title: const Text('Onboarding'),
            subtitle: Text(
              settings.hasCompletedOnboarding
                  ? 'Welcome flow will be skipped'
                  : 'Welcome flow will show on next launch',
            ),
            trailing: AnimatedSwitcher(
              duration: 250.ms,
              child: settings.hasCompletedOnboarding
                  ? Chip(
                      key: const ValueKey('done'),
                      avatar: Icon(Icons.check_circle_rounded, size: 18, color: scheme.primary),
                      label: const Text('Completed'),
                      side: BorderSide.none,
                      backgroundColor: scheme.primary.withValues(alpha: 0.12),
                    )
                  : TextButton(
                      key: const ValueKey('pending'),
                      onPressed: () => _guard(context, notifier.completeOnboarding),
                      child: const Text('Mark complete'),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton.tonalIcon(
                style: FilledButton.styleFrom(
                  foregroundColor: scheme.error,
                  backgroundColor: scheme.errorContainer.withValues(alpha: 0.5),
                ),
                icon: const Icon(Icons.restart_alt_rounded),
                label: const Text('Reset to defaults'),
                onPressed: () => _guard(context, notifier.reset),
              ),
            ),
          ),
        ],
      ).animate(delay: 60.ms).fadeIn(duration: 350.ms),
    );
  }

  /// Runs a mutation and reports persistence failures to the user.
  Future<void> _guard(BuildContext context, Future<void> Function() action) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      await action();
    } catch (e) {
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(behavior: SnackBarBehavior.floating, content: Text(e.toString())));
    }
    // } on StorageFailure catch (failure) {
    //   messenger
    //     ..hideCurrentSnackBar()
    //     ..showSnackBar(SnackBar(behavior: SnackBarBehavior.floating, content: Text(failure.message)));
    // }
  }
}

class _ControlTile extends StatelessWidget {
  const _ControlTile({required this.icon, required this.title, required this.child});

  final IconData icon;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 22, color: theme.colorScheme.onSurfaceVariant),
              const SizedBox(width: 16),
              Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
