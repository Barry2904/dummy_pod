import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/user_model.dart';
import 'api_service.dart';

// Provider for the ApiService
final apiServiceProvider = Provider((ref) => ApiService());

// StateNotifier for managing user list
class UserListNotifier extends StateNotifier<AsyncValue<List<User>>> {
  final ApiService apiService;

  UserListNotifier(this.apiService) : super(const AsyncValue.loading()) {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final users = await apiService.fetchUsers();
      state = AsyncValue.data(users);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> updateUser(int id, User updatedUser) async {
    await apiService.updateUser(id, updatedUser.toJson());
    fetchUsers(); // Refresh users after update
  }
}

// StateNotifierProvider for UserList
final userListProvider =
    StateNotifierProvider<UserListNotifier, AsyncValue<List<User>>>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return UserListNotifier(apiService);
});
