import 'dart:developer';

import 'package:appwrite_playground/providers/appwrite_providers.dart';
import 'package:appwrite_playground/routes/home_page/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  await ref
                      .read(appwriteCreateOAuthLoginProvider.notifier)
                      .login();
                  if (!mounted) return;
                  ref.refresh(appwriteClientProvider);
                  ref.refresh(appwriteAccountProvider);
                  Navigator.pushReplacementNamed(
                    context,
                    UserListPage.routeName,
                  );
                } catch (e) {
                  log(e.toString());
                }
              },
              child: const Text('Continue with Google'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await ref.read(appwriteAccountProvider).createSession(
                        email: 'test2@test.com',
                        password: 'qwerty123',
                      );
                  if (!mounted) return;
                  Navigator.pushReplacementNamed(
                    context,
                    UserListPage.routeName,
                  );
                } catch (e) {
                  log(e.toString());
                }
              },
              child: const Text('Continue with User'),
            ),
          ],
        ),
      ),
    );
  }
}
