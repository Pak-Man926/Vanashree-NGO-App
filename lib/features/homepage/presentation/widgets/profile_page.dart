import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vanashree_ngo_application/core/common/components/app_bar_widget.dart';
import 'package:vanashree_ngo_application/core/extensions/build_context_extensions.dart';
import 'package:vanashree_ngo_application/features/homepage/di/notifier_di.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/state/profile_state.dart';

/// Basic demo UI for Profile CRUD operations.
/// This is intentionally simple and self-contained for development/demo purposes.
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileNotifierProvider);
    final notifier = ref.read(profileNotifierProvider.notifier);
    final textTheme = context.textTheme;

    Widget bodyChild;
    if (state.status == ProfileStatus.loading) {
      bodyChild = const Center(child: CircularProgressIndicator());
    } else if (state.status == ProfileStatus.error) {
      bodyChild = Center(
        child: Text(
          state.message ?? 'Unknown error',
          style: textTheme.bodyMedium?.copyWith(color: Colors.red),
        ),
      );
    } else if (state.status == ProfileStatus.success && state.profile != null) {
      final p = state.profile!;
      bodyChild = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(p.name, style: textTheme.titleLarge),
          const SizedBox(height: 8),
          Text('Village: ${p.village}'),
          Text('Member since: ${p.memberSince}'),
          Text('Trees planted: ${p.treesPlanted}'),
        ],
      );
    } else {
      bodyChild = const Center(child: Text('No profile loaded'));
    }

    return Scaffold(
      appBar: const AppBarWidget(title: 'Profile', centerTitle: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: bodyChild,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
