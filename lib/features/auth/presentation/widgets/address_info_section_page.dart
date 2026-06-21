
import 'package:flutter/material.dart';
import 'package:searchable_dropdown_field/searchable_dropdown_field.dart';

import '../../../../core/common/components/primary_button.dart';
import '../../../../core/common/constants/app_images.dart';
import '../../../../core/common/constants/padding_constants.dart';
import '../../../../core/common/constants/sizedbox_constants.dart';
import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/locator.dart';

class AddressInfoSectionPage extends StatelessWidget {
  const AddressInfoSectionPage({super.key, 
    required this.formKey,
    required this.countryController,
    required this.stateController,
    required this.cityController,
    required this.pageController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController countryController;
  final TextEditingController stateController;
  final TextEditingController cityController;
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
              context.l10n.sign_up2_title,
              style: context.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacing.vertical(10),
            Text(
              context.l10n.sign_up2_description,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacing.vertical(20),
            Text(
              context.l10n.country,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SearchableDropdownTextField<String>(
              controller: countryController,
              items: ["Nepal", "India", "USA", "UK", "Germany", "France"],
              itemAsString: (item) => item,
              hintText: "Select Country",
              onSelected: (value) {
                appLog.error(value);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.l10n.please_select_a_country;
                }
                return null;
              },
            ),
            const Spacing.vertical(20),
            Text(
              context.l10n.state,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SearchableDropdownTextField<String>(
              controller: stateController,
              items: [
                "Bagmati",
                "Gandaki",
                "Lumbini",
                "Karnali",
                "Sudurpashchim",
              ],
              itemAsString: (item) => item,
              hintText: "Select State",
              onSelected: (value) {
                appLog.error(value);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.l10n.please_select_a_state;
                }
                return null;
              },
            ),
            const Spacing.vertical(20),
            Text(
              context.l10n.city,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SearchableDropdownTextField<String>(
              controller: cityController,
              items: [
                "Kathmandu",
                "Pokhara",
                "Lalitpur",
                "Biratnagar",
                "Birgunj",
              ],
              itemAsString: (item) => item,
              hintText: "Select City",
              onSelected: (value) {
                appLog.error(value);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return context.l10n.please_select_a_city;
                }
                return null;
              },
            ),
            const Spacing.vertical(40),
            Align(
              alignment: Alignment.centerRight,
              child: Transform.rotate(
                angle: 0.1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(AppImages.seedling, height: 200),
                ),
              ),
            ),
            const Spacing.vertical(50),
            PrimaryButton(
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
            PrimaryButton(
              shouldElevate: false,
              backgroundColor: context.colorScheme.surfaceContainer,
              textColor: context.colorScheme.onSecondary,
              prefixIcon: Icons.arrow_back,
              title: context.l10n.back,
              onPressed: () {
                pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
            ),
            const Spacing.vertical(20),
          ],
        ),
      ),
    );
  }
}
