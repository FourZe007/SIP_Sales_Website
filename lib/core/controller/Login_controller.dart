import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stsj/core/models/AuthModel/DataAuth.dart';

class DataLoginController {
  static Future<List<DataLogin>> login(String User, String Password) async {
    try {
      String userid = User;
      String userpass = Password;

      Map<String, String> loginData = {
        'UserID': userid,
        'DecryptedPassword': userpass,
      };

      // Convert the map to a JSON string
      final String jsonBody = json.encode(loginData);

      // Set the 'Content-Type' header to 'application/json'
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      final response = await http
          .post(
              Uri.parse(
                'https://wsip.yamaha-jatim.co.id:2448/api/Login/Login',
              ),
              headers: headers,
              body: jsonBody)
          .timeout(const Duration(seconds: 20));

      if (response.statusCode == 200) {
        var jsonDecode = json.decode(response.body);

        List<DataLogin> listlogin = (jsonDecode as Map<String, dynamic>)['Data']
            .map<DataLogin>((data) => DataLogin.fromJson(data))
            .toList();

        return listlogin;
      } else {
        throw Exception("Terjadi kesalahan");
      }
    } catch (error) {
      throw Exception("Terjadi kesalahan saat memuat data.");
    }
  }

  static Future<void> setIntoSharedPreferences(
    String userID,
    String EntryLevelID,
    String EntryLevelName,
  ) async {
    SharedPreferences NamaLoginPref = await SharedPreferences.getInstance();
    await NamaLoginPref.setBool("Status", true);
    await NamaLoginPref.setString("UserID", userID);
    await NamaLoginPref.setString("EntryLevelID", EntryLevelID);
    await NamaLoginPref.setString("EntryLevelName", EntryLevelName);
  }

  static void removeDataUser() async {
    try {
      SharedPreferences NamaLoginPref = await SharedPreferences.getInstance();
      await NamaLoginPref.clear();
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
