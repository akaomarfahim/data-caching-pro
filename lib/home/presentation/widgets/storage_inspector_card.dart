import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../settings/settings.dart';
import 'surface_card.dart';

/// Live view of the persisted settings record. Rebuilds whenever the
/// settings controller writes, so every change is visible as it is stored.
class StorageInspectorCard extends ConsumerWidget {
  const StorageInspectorCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapshot = ref.watch(settingsStorageSnapshotProvider);

    return SurfaceCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _StatusRow(isPersisted: snapshot.isPersisted),
          const SizedBox(height: 16),
          _PipelineStrip(schemaVersion: snapshot.schemaVersion),
          const SizedBox(height: 16),
          _MetricsGrid(snapshot: snapshot),
          const SizedBox(height: 16),
          _JsonViewer(snapshot: snapshot),
        ],
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  const _StatusRow({required this.isPersisted});

  final bool isPersisted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isPersisted
        ? theme.colorScheme.primary
        : theme.colorScheme.outline;

    return Row(
      children: [
        Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.4),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
            )
            .animate(onPlay: (controller) => controller.repeat(reverse: true))
            .scaleXY(
              begin: 0.85,
              end: 1.15,
              duration: 900.ms,
              curve: Curves.easeInOut,
            ),
        const SizedBox(width: 12),
        Expanded(
          child: AnimatedSwitcher(
            duration: 250.ms,
            child: Text(
              isPersisted
                  ? 'Persisted on this device'
                  : 'Defaults in use · nothing written yet',
              key: ValueKey(isPersisted),
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Visualizes the write path: Notifier -> Repository -> Codec -> storage.
class _PipelineStrip extends StatelessWidget {
  const _PipelineStrip({required this.schemaVersion});

  final int? schemaVersion;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final steps = <(IconData, String)>[
      (Icons.tune_rounded, 'AppSettingsNotifier'),
      (Icons.account_tree_rounded, 'Repository'),
      (
        Icons.data_object_rounded,
        schemaVersion == null ? 'Codec' : 'Codec v$schemaVersion',
      ),
      (Icons.storage_rounded, 'SharedPreferences'),
    ];

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 6,
      runSpacing: 6,
      children: [
        for (final (index, step) in steps.indexed) ...[
          _PipelineChip(icon: step.$1, label: step.$2)
              .animate(delay: (index * 90).ms)
              .fadeIn(duration: 300.ms)
              .slideX(begin: -0.1, end: 0, curve: Curves.easeOutCubic),
          if (index < steps.length - 1)
            Icon(
              Icons.arrow_forward_rounded,
              size: 14,
              color: scheme.outline,
            ),
        ],
      ],
    );
  }
}

class _PipelineChip extends StatelessWidget {
  const _PipelineChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.primaryContainer.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: scheme.onPrimaryContainer),
            const SizedBox(width: 6),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: scheme.onPrimaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricsGrid extends StatelessWidget {
  const _MetricsGrid({required this.snapshot});

  final SettingsStorageSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final metrics = <(IconData, String, String)>[
      (Icons.key_rounded, 'Storage key', snapshot.storageKey),
      (
        Icons.layers_rounded,
        'Schema',
        snapshot.schemaVersion == null ? '—' : 'v${snapshot.schemaVersion}',
      ),
      (Icons.data_usage_rounded, 'Payload', '${snapshot.sizeInBytes} B'),
      (Icons.memory_rounded, 'Backend', snapshot.backend),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final tileWidth = (constraints.maxWidth - 8) / 2;

        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final (index, metric) in metrics.indexed)
              SizedBox(
                    width: tileWidth,
                    child: _MetricTile(
                      icon: metric.$1,
                      label: metric.$2,
                      value: metric.$3,
                    ),
                  )
                  .animate(delay: (200 + index * 70).ms)
                  .fadeIn(duration: 300.ms)
                  .scaleXY(begin: 0.96, end: 1, curve: Curves.easeOutBack),
          ],
        );
      },
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(icon, size: 18, color: scheme.primary),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: 200.ms,
                    child: Text(
                      value,
                      key: ValueKey(value),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _JsonViewer extends StatelessWidget {
  const _JsonViewer({required this.snapshot});

  final SettingsStorageSnapshot snapshot;

  static final _token = RegExp(
    r'("(?:[^"\\]|\\.)*")(\s*:)?|\b(?:true|false|null)\b|-?\d+(?:\.\d+)?',
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final muted = scheme.onInverseSurface.withValues(alpha: 0.7);
    final mono = theme.textTheme.bodySmall?.copyWith(
      fontFamily: 'monospace',
      fontFamilyFallback: const ['Courier New', 'Courier'],
      height: 1.5,
      color: scheme.onInverseSurface,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.inverseSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 4, 4),
            child: Row(
              children: [
                Icon(Icons.description_outlined, size: 16, color: muted),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${snapshot.storageKey}  ·  stored value',
                    style: theme.textTheme.labelMedium?.copyWith(color: muted),
                  ),
                ),
                IconButton(
                  tooltip: 'Copy JSON',
                  visualDensity: VisualDensity.compact,
                  icon: Icon(Icons.copy_rounded, size: 18, color: muted),
                  onPressed: snapshot.isPersisted
                      ? () => _copy(context, snapshot.prettyJson)
                      : null,
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: scheme.onInverseSurface.withValues(alpha: 0.12),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: AnimatedSize(
              duration: 250.ms,
              curve: Curves.easeOutCubic,
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: double.infinity,
                child:
                    (snapshot.isPersisted
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text.rich(
                                  TextSpan(
                                    style: mono,
                                    children: _highlight(
                                      snapshot.prettyJson,
                                      scheme,
                                    ),
                                  ),
                                ),
                              )
                            : Text(
                                'Nothing has been written yet.\n'
                                'Change a setting below and the record '
                                'appears here.',
                                style: mono?.copyWith(color: muted),
                              ))
                        // New key => the effect replays on every change.
                        .animate(key: ValueKey(snapshot.prettyJson))
                        .fadeIn(duration: 220.ms)
                        .shimmer(
                          duration: 700.ms,
                          color: scheme.inversePrimary.withValues(alpha: 0.35),
                        ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static List<InlineSpan> _highlight(String source, ColorScheme scheme) {
    final spans = <InlineSpan>[];
    var cursor = 0;

    for (final match in _token.allMatches(source)) {
      if (match.start > cursor) {
        spans.add(TextSpan(text: source.substring(cursor, match.start)));
      }

      final string = match.group(1);
      final colon = match.group(2);
      final isKey = string != null && colon != null;
      final color = switch ((string != null, isKey)) {
        (true, true) => scheme.inversePrimary,
        (true, false) => scheme.tertiaryContainer,
        _ => scheme.secondaryContainer,
      };

      spans.add(
        TextSpan(
          text: string ?? match.group(0),
          style: TextStyle(color: color),
        ),
      );
      if (isKey) spans.add(TextSpan(text: colon));

      cursor = match.end;
    }

    if (cursor < source.length) {
      spans.add(TextSpan(text: source.substring(cursor)));
    }
    return spans;
  }

  Future<void> _copy(BuildContext context, String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!context.mounted) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Copied to clipboard'),
        ),
      );
  }
}
