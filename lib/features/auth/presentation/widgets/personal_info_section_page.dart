import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vanashree_ngo_application/core/common/components/app_textfield.dart';
import 'package:vanashree_ngo_application/core/common/components/primary_button.dart';
import 'package:vanashree_ngo_application/core/common/constants/app_images.dart';
import 'package:vanashree_ngo_application/core/common/constants/padding_constants.dart';
import 'package:vanashree_ngo_application/core/extensions/build_context_extensions.dart';

import '../../../../core/common/constants/sizedbox_constants.dart';
import '../../../../core/locator.dart';

class PersonalInfoSectionPage extends StatelessWidget {
  const PersonalInfoSectionPage({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.mobileController,
    required this.pageController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController mobileController;
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
              context.l10n.sign_up1_title,
              style: context.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacing.vertical(10),
            Text(
              context.l10n.sign_up1_description,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacing.vertical(20),
            Text(
              context.l10n.full_name,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.theme.colorScheme.tertiaryContainer,
              ),
            ),
            AppTextField(
              controller: nameController,
              hintText: 'Enter your name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.l10n.please_enter_your_name;
                }
                return null;
              },
            ),
            const Spacing.vertical(20),
            Text(
              context.l10n.email_address,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.theme.colorScheme.tertiaryContainer,
              ),
            ),
            AppTextField(
              controller: emailController,
              hintText: 'nature@example.com',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.l10n.please_enter_your_email;
                }
                return null;
              },
            ),
            const Spacing.vertical(20),
            Text(
              context.l10n.mobile_number,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.theme.colorScheme.tertiaryContainer,
              ),
            ),
            AppTextField(
              controller: mobileController,
              hintText: '+1 (555) 000-0000',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.l10n.please_enter_your_mobile_number;
                }
                return null;
              },
            ),
            const Spacing.vertical(40),
            Container(
              decoration: BoxDecoration(
                color: context.colorScheme.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: Paddings.kPadding24,
              child: Row(
                children: [
                  SvgPicture.asset(AppImages.plant),
                  const Spacing.horizontal(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.security_and_trust,
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: context.colorScheme.onPrimary,
                          ),
                        ),
                        Text(
                          context.l10n.security_and_trust_description,
                          softWrap: true,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: context.colorScheme.onPrimary.withValues(
                              alpha: 0.8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacing.vertical(40),
            PrimaryButton(
              suffixIcon: Icons.arrow_forward,
              padding: Paddings.kVerticalPadding24,
              borderRadius: 32,
              shouldElevate: false,
              backgroundColor: context.colorScheme.primary,
              textColor: context.colorScheme.onPrimary,
              title: context.l10n.next_step,
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                } else {
                  appLog.error('Form is invalid, please correct the errors');
                }
              },
            ),
            const Spacing.vertical(40),
            Center(
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    const TextSpan(text: "By continuing, you agree to our "),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          //context.push(RouteNames.auth.signup);
                        },
                        child: Text(
                          "Privacy Policy",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacing.vertical(40),
          ],
        ),
      ),
    );
  }
}
