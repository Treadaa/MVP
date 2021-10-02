import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userLoggedInProvider =
    ChangeNotifierProvider<UserLoggedIn>((ref) => UserLoggedIn());

class UserLoggedIn extends ChangeNotifier {
  bool isUserSignedIn = false;
  void setUserCurrentState(userState) {
    isUserSignedIn = userState;
    notifyListeners();
  }

  bool getUserCurrentState() {
    return isUserSignedIn;
  }
}
