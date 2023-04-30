import 'package:flutter/material.dart';

class WrapBuilder extends StatelessWidget {
  final double spacing;
  final double runSpacing;
  final WrapAlignment alignment;
  final WrapCrossAlignment crossAxisAlignment;
  final Axis direction;
  final WrapAlignment runAlignment;
  final VerticalDirection verticalDirection;
  final Clip clipBehavior;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;

  const WrapBuilder({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    this.spacing = 8,
    this.runSpacing = 8,
    this.alignment = WrapAlignment.center,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.direction = Axis.horizontal,
    this.runAlignment = WrapAlignment.start,
    this.verticalDirection = VerticalDirection.down,
    this.clipBehavior = Clip.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      alignment: alignment,
      crossAxisAlignment: crossAxisAlignment,
      direction: direction,
      runAlignment: runAlignment,
      verticalDirection: verticalDirection,
      clipBehavior: clipBehavior,
      children: List.generate(itemCount, (index) => itemBuilder(context, index), growable: false).toList(),
    );
  }
}
