import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vanashree_ngo_application/core/common/constants/padding_constants.dart';
import 'package:vanashree_ngo_application/core/extensions/build_context_extensions.dart';
import 'package:vanashree_ngo_application/features/homepage/domain/entity/personal_impact_entity.dart';

class PersonalImpactCard extends StatelessWidget {
  const PersonalImpactCard({super.key, required this.personalImpact});
  final PersonalImpactEntity personalImpact;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;
    return Container(
      padding: Paddings.kPadding20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.primaryColor.withValues(alpha: 0.75),
          width: 0.5,
        ),
      ),
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(personalImpact.icon, height: 24, width: 24),
          Text(personalImpact.title, style: textTheme.labelLarge),
          Text('${personalImpact.value}', style: textTheme.headlineLarge),
        ],
      ),
    );
  }
}
