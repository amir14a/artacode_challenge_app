import 'package:artacode_challenge_app/repository/enums.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  ValueNotifier<AppApiRequestState> requestState = ValueNotifier(AppApiRequestState.NOT_SENT_YET);
  ValueNotifier<String?> errorText = ValueNotifier(null);
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  RegisterViewModel() {
    requestState.addListener(notifyListeners);
    errorText.addListener(notifyListeners);
  }

  @override
  void dispose() {
    requestState.dispose();
    errorText.dispose();
    super.dispose();
  }
}
