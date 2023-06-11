import '../services/preference/preference.dart';

const serverkey = "https://dev.vginv.com/ar/api/mobile/";

class Connection {
  static chooseheadear({bool guest = false, bool token = true}) async {
    Map<String, String> header = {
      "Content-Type": "application/json",
    };

    if (token) {
      final usertoken = Preference.getString(PrefKeys.token);

      header["Authorization"] = "Bearer ${usertoken}";
    }
    if (guest) {
      final guesttoken = Preference.getString("Guesttoken");

      header["info"] = guesttoken;
    }
    return header;
  }
}
