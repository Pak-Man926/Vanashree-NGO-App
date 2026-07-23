import 'package:flutter/material.dart';

import '../../../../core/common/components/app_textfield.dart';
import '../../../../core/common/components/primary_button.dart';
import '../../../../core/common/constants/padding_constants.dart';
import '../../../../core/common/constants/sizedbox_constants.dart';
import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/locator.dart';

class BioSectionPage extends StatelessWidget {
  const BioSectionPage({
    super.key,
    required this.formKey,
    required this.bioController,
    required this.pageController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController bioController;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: Paddings.kHorizontalPadding15,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacing.vertical(30),
            Text(
              context.l10n.sign_up3_title,
              style: context.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacing.vertical(10),
            Text(
              context.l10n.sign_up3_description,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacing.vertical(20),
            Text(
              context.l10n.your_bio,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            AppTextField(
              controller: bioController,
              hintText: 'Tell us why you care about native seedlings...',
              maxLines: 5,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.l10n.please_enter_your_bio;
                }
                return null;
              },
            ),
            const Spacing.vertical(50),
            PrimaryButton(
              shouldElevate: false,
              backgroundColor: context.colorScheme.surfaceContainer,
              textColor: context.colorScheme.onSecondary,
              title: context.l10n.back,
              onPressed: () {
                pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
            ),
            const Spacing.vertical(10),
            PrimaryButton(
              shouldElevate: false,
              backgroundColor: context.colorScheme.primary,
              textColor: context.colorScheme.onPrimary,
              title: context.l10n.complete_onboarding,
              suffixIcon: Icons.check_circle_outlined,
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  appLog.info('Form is valid, submitting');
                } else {
                  appLog.error('Form is invalid, please correct the errors');
                }
              },
            ),
            const Spacing.vertical(20),
          ],
        ),
      ),
    );
  }
}
