import 'package:batch_meal_v2/data/repositories/shared_presfs_repository.dart';

class CheckOnboardingUseCase {
  final SharedPrefsRepository repository;

  CheckOnboardingUseCase(this.repository);

  Future<bool> call() async {
    return await repository.hasSeenOnboarding();
  }
}
