import 'dart:developer';

import 'package:appwrite_playground/providers/appwrite_providers.dart';
import 'package:appwrite_playground/routes/home_page/data_list.dart';
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
        child: ElevatedButton(
          onPressed: () async {
            try {
              await ref.read(appwriteCreateOAuthLoginProvider.notifier).login();
              if (!mounted) return;
              Navigator.pushReplacementNamed(context, DataList.routeName);
            } catch (e) {
              log(e.toString());
            }
          },
          child: const Text('Continue with Google'),
        ),
      ),
    );
  }
}
