import "package:flutter/material.dart";
import "package:vanashree_ngo_application/core/extensions/build_context_extensions.dart";

class RequestButton extends StatelessWidget {
  const RequestButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        border: const Border.symmetric(),
        borderRadius: BorderRadius.circular(30),
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Center(
          child: Text(
            label,
            style: context.textTheme.labelLarge!.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
