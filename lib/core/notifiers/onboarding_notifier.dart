import 'package:batch_meal_v2/data/repositories/shared_presfs_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class OnboardingNotifier extends StateNotifier<bool?> {
  final SharedPrefsRepository _repository;

  OnboardingNotifier(this._repository) : super(null);

  Future<void> checkOnboardingStatus() async {
    state = await _repository.hasSeenOnboarding();
  }

  Future<void> completeOnboarding() async {
    await _repository.setOnboardingSeen();
    state = true; // Update state so the app navigates to login
  }
}

// Riverpod Provider
final onboardingProvider = StateNotifierProvider<OnboardingNotifier, bool?>(
  (ref) => OnboardingNotifier(ref.read(sharedPrefsRepositoryProvider)),
);

// Repository Provider
final sharedPrefsRepositoryProvider = Provider((ref) => SharedPrefsRepository());
