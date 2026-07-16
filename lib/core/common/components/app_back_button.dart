import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vanashree_ngo_application/core/common/constants/padding_constants.dart';
import 'package:vanashree_ngo_application/core/extensions/build_context_extensions.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return GestureDetector(
      onTap: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
      child: Container(
        padding: Paddings.kPadding4,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: theme.colorScheme.secondary),
        ),
        child: Icon(
          Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
