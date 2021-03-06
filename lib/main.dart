import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:appwrite_playground/providers/appwrite_providers.dart';
import 'package:appwrite_playground/routes/chat_page/chat_page.dart';
import 'package:appwrite_playground/routes/home_page/user_list.dart';
import 'package:appwrite_playground/routes/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late User? user;
  final container = ProviderContainer();
  try {
    user = await container.read(appwriteAccountProvider).get();
  } on AppwriteException catch (e) {
    log(e.message!);
    user = null;
  }
  //for disposing the container without widget binding.
  container.dispose();
  runApp(
    ProviderScope(
      overrides: [
        appwriteUserProvider.overrideWithValue(user),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appwrite Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return ref.watch(appwriteUserProvider) == null
              ? const LoginPage()
              : const UserListPage();
        },
      ),
      routes: {
        UserListPage.routeName: (context) => const UserListPage(),
        ChatListPage.routeName: (context) => ChatListPage(),
      },
    );
  }
}
