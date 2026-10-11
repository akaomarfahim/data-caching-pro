import 'package:flutter/material.dart';

/// Bordered, tonal container. Uses [Material] (not DecoratedBox) so ink
/// effects from children such as ListTile render above the background.
class SurfaceCard extends StatelessWidget {
  const SurfaceCard({
    required this.child,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Material(
      color: scheme.surfaceContainerLow,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: scheme.outlineVariant.withValues(alpha: 0.6)),
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}
