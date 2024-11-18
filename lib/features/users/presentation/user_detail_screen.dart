import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../logic/user_provider.dart';
import '../data/user_model.dart';

class UserDetailScreen extends ConsumerWidget {
  final User user;

  const UserDetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.read(userListProvider.notifier);

    final nameController = TextEditingController(text: user.name);
    final emailController = TextEditingController(text: user.email);

    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final updatedUser = User(
                  id: user.id,
                  name: nameController.text,
                  email: emailController.text,
                );
                await userNotifier.updateUser(user.id, updatedUser);
                Navigator.pop(context); // Go back to the user list
              },
              child: const Text('Update User'),
            ),
          ],
        ),
      ),
    );
  }
}
