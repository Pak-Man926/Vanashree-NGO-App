import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/providers/profile_notifier.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/state/profile_state.dart';

final profileNotifierProvider = NotifierProvider<ProfileNotifier, ProfileState>(
  ProfileNotifier.new,
);
