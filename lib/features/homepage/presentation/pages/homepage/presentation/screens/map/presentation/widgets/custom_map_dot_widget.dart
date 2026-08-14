import 'package:flutter/material.dart';
import 'package:vanashree_ngo_application/core/extensions/build_context_extensions.dart';

class CustomMapDot extends StatelessWidget {
  const CustomMapDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colorScheme.primary,
        border: Border.all(color: Colors.white.withOpacity(0.4), width: 3),
      ),
    );
  }
}
