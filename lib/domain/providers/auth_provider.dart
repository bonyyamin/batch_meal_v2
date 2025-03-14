import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/services/auth_service.dart';

final authProvider = StateProvider<User?>((ref) => null);

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});
