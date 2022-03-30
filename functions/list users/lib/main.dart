import 'dart:convert';

import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';

Future<void> start(final req, final res) async {
  final Client client = Client();
  final Users users = Users(client);
  late UserList userList;

  if (req.env['APPWRITE_FUNCTION_ENDPOINT'] == null ||
      req.env['APPWRITE_FUNCTION_PROJECT_ID'] == null ||
      req.env['APPWRITE_FUNCTION_API_KEY'] == null) {
    print(
        "Environment variables are not set. Function cannot use Appwrite SDK.");
  } else {
    client
        .setEndpoint(req.env['APPWRITE_FUNCTION_ENDPOINT'])
        .setProject(req.env['APPWRITE_FUNCTION_PROJECT_ID'])
        .setKey(req.env['APPWRITE_FUNCTION_API_KEY'])
        .setSelfSigned(status: true);
    try {
      userList = await users.list();
      final response = {
        'total': userList.total,
        'users': json.encode(userList.users.map((e) => e.toMap()).toList()),
      };
      res.json(response);
    } on AppwriteException catch (e) {
      throw AppwriteException(e.message);
    }
  }
}
