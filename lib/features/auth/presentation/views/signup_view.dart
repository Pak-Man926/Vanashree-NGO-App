import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vanashree_ngo_application/features/auth/presentation/widgets/address_info_section_page.dart';
import 'package:vanashree_ngo_application/features/auth/presentation/widgets/bio_section_page.dart';
import 'package:vanashree_ngo_application/features/auth/presentation/widgets/personal_info_section_page.dart';

import '../../../../core/common/constants/constants.dart';
import '../../../../core/extensions/build_context_extensions.dart';

class SignUpView extends HookWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final countryController = useTextEditingController();
    final stateController = useTextEditingController();
    final cityController = useTextEditingController();
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final mobileController = useTextEditingController();
    final bioController = useTextEditingController();
    final pageController = usePageController(initialPage: 0);
    final currentPage = useState(0);

    final formKey1 = useMemoized(() => GlobalKey<FormState>());
    final formKey2 = useMemoized(() => GlobalKey<FormState>());
    final formKey3 = useMemoized(() => GlobalKey<FormState>());

    final progressValue = (currentPage.value + 1) / 3;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: currentPage.value == 0,
              backgroundColor: context.theme.scaffoldBackgroundColor,
              title: Text(
                "Vanashree",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.colorScheme.primary,
                ),
              ),
              actions: [
                Text(
                  'STEP ${(currentPage.value + 1).toString().padLeft(2, '0')} / 03      ',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.colorScheme.tertiaryContainer,
                  ),
                ),
              ],
              pinned: true,
            ),
          ];
        },
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${(progressValue * 100).toInt()}% complete',
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: progressValue),
                    duration: const Duration(milliseconds: 300),
                    builder: (context, value, child) {
                      return LinearProgressIndicator(
                        value: value,
                        backgroundColor: context.colorScheme.primary.withValues(
                          alpha: 0.3,
                        ),
                        minHeight: 15,
                        borderRadius: BorderRadius.circular(8),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          context.colorScheme.primary,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                onPageChanged: (page) {
                  currentPage.value = page;
                },
                children: [
                  PersonalInfoSectionPage(
                    formKey: formKey1,
                    nameController: nameController,
                    emailController: emailController,
                    mobileController: mobileController,
                    pageController: pageController,
                  ),
                  AddressInfoSectionPage(
                    formKey: formKey2,
                    countryController: countryController,
                    stateController: stateController,
                    cityController: cityController,
                    pageController: pageController,
                  ),
                  BioSectionPage(
                    formKey: formKey3,
                    bioController: bioController,
                    pageController: pageController,
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
