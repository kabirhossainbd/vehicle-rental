import 'dart:convert';
import 'package:flutter/services.dart';

class GetServerKey {
  static Future<String> getServerToken() async {
    // final scopes = [
    //   'https://www.googleapis.com/auth/userinfo.email',
    //   'https://www.googleapis.com/auth/firebase.database',
    //   'https://www.googleapis.com/auth/firebase.messaging',
    // ];
    // final jsonString = await rootBundle.loadString('assets/language/upto-firebase-service.json');
    //
    // // Parse credentials
    // final credentials = ServiceAccountCredentials.fromJson(jsonDecode(jsonString));
    //
    // final client = await clientViaServiceAccount(credentials, scopes);
    // final accessToken = client.credentials.accessToken.data;
    // client.close(); // ✅ Close the client after use
    //
    // print('$accessToken ###');
    return 'accessToken';
  }
}
